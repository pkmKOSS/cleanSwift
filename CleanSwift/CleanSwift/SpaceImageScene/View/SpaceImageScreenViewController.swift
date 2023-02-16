//  SpaceImageScreenViewController.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import UIKit

/// Контроллер представления сцены с изображением космоса
final class SpaceImageScreenViewController: UIViewController {

    // MARK: - Private constants

    private enum Constants {
        static let spaceDescriptionLabelName = "Идет загрузка..."
        static let goSecondScreenButtonName = " На второй экран "
    }

    // MARK: - Visual components

    private var spaceImageView = UIImageView()
    private var spaceDescriptionLabel = UILabel()
    private var goSecondScreenButton = UIButton()

    // MARK: - Private properties

    private var presentedSpaceImage: SpaceImageModel.FetchSpaceImageDescription.ViewModel?

    // MARK: Public properites

    var router: SpaceImageScreenRoutingLogic?
    var interactor: SpaceImageScreenBusinessLogic?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreen()
        interactor?.fetchSpaceImageDescription(RequestDescriptionModel())
    }

    // MARK: - Public methods

    func handleDeepLink(link: DeepLink) {
        switch link {
            case .imageScreen:
                break
            case .sizeConvertingScreen:
                router?.routToConverterScene()
        }
    }

    // MARK: - Private methods

    private func configureScreen() {
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        configureSpaceImageView()
        configureSpaceDescriptionLabel()
        configureGoSecondScreenButton()
    }

    private func configureSpaceImageView() {
        view.addSubview(spaceImageView)
        spaceImageView.center.y = view.center.y
        spaceImageView.translatesAutoresizingMaskIntoConstraints = false
        spaceImageView.contentMode = .scaleAspectFit
        spaceImageView.layer.cornerRadius = 15
        spaceImageView.backgroundColor = .black
        NSLayoutConstraint.activate([
            spaceImageView.widthAnchor.constraint(equalToConstant: 300),
            spaceImageView.heightAnchor.constraint(equalToConstant: 300),
            spaceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spaceImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }

    private func configureSpaceDescriptionLabel() {
        view.addSubview(spaceDescriptionLabel)
        spaceDescriptionLabel.text = Constants.spaceDescriptionLabelName
        spaceDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        spaceDescriptionLabel.clipsToBounds = true
        spaceDescriptionLabel.layer.cornerRadius = 5
        spaceDescriptionLabel.textColor = .black
        spaceDescriptionLabel.textAlignment = .center
        spaceDescriptionLabel.numberOfLines = 10
        NSLayoutConstraint.activate([
            spaceDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spaceDescriptionLabel.topAnchor.constraint(equalTo: spaceImageView.bottomAnchor, constant: +15),
            spaceDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +15),
            spaceDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }

    private func configureGoSecondScreenButton() {
        view.addSubview(goSecondScreenButton)
        goSecondScreenButton.translatesAutoresizingMaskIntoConstraints = false
        goSecondScreenButton.setTitle(Constants.goSecondScreenButtonName, for: .normal)
        goSecondScreenButton.clipsToBounds = true
        goSecondScreenButton.layer.cornerRadius = 5
        goSecondScreenButton.tintColor = .white
        goSecondScreenButton.backgroundColor = .purple
        NSLayoutConstraint.activate([
            goSecondScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goSecondScreenButton.topAnchor.constraint(equalTo: spaceDescriptionLabel.bottomAnchor, constant: +15)
        ])
        goSecondScreenButton.addTarget(self, action: #selector(goToSecondScreenAction), for: .touchUpInside)
    }

    @objc private func goToSecondScreenAction() {
        router?.routToConverterScene()
    }
}

/// Методы SpaceImageScreenDisplayLogic
extension SpaceImageScreenViewController: SpaceImageScreenDisplayLogic {
    func displaySpaceImageDescroption(_ viewModel: DescriptionViewModel) {
        presentedSpaceImage = viewModel
        DispatchQueue.main.async {
            self.spaceDescriptionLabel.text = viewModel.spaceImage.explanation
            self.interactor?.fetchSpaceImageData(RequestDataModel(url: self.presentedSpaceImage?.spaceImage.hdurl ?? String()))
        }
    }

    func displaySpaceImage(_ viewModel: ImageDataViewModel) {
        DispatchQueue.main.async {
            self.spaceImageView.image = UIImage(data: viewModel.spaceImageData)
        }
    }
}
