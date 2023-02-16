//  SizeConverterViewController.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import UIKit

/// Контроллер сцены с конвертером размера изображения
final class SizeConverterViewController: UIViewController {

    // MARK: - Private constants

    private enum Constants {
        static let defaultSizeValueName = "0"
        static let showMBSizeButtonName =  "Размер в мегабайтах"
        static let showKBSizeButtonName =  "Размер в килобайтах"
    }

    // MARK: - Visual components

    private var sizeOfDataLabel = UILabel()
    private var subView = UIView()
    private var showMBSizeButton = UIButton()
    private var showKBSizeButton = UIButton()

    // MARK: - Public properties

    var router: SizeConverterRoutingLogic?
    var interactor: SizeConverterBusinessLogic?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureScreen()
    }

    // MARK: - Private methods

    private func configureScreen() {
        configureBackground()
        configureBackgroundSubview()
    }

    private func configureBackground() {
        view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    }

    private func configureBackgroundSubview() {
        view.addSubview(subView)
        subView.backgroundColor = .white
        subView.layer.cornerRadius = 5
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            subView.widthAnchor.constraint(equalToConstant: 300),
            subView.heightAnchor.constraint(equalToConstant: 200)
        ])
        configureSizeOfDataLabel()
        configureShowMBSizeButton()
        configureShowKBSizeButton()
    }

    private func configureSizeOfDataLabel() {
        subView.addSubview(sizeOfDataLabel)
        sizeOfDataLabel.text = Constants.defaultSizeValueName
        sizeOfDataLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeOfDataLabel.clipsToBounds = true
        sizeOfDataLabel.layer.cornerRadius = 5
        sizeOfDataLabel.textColor = .black
        sizeOfDataLabel.numberOfLines = 10
        NSLayoutConstraint.activate([
            sizeOfDataLabel.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
            sizeOfDataLabel.topAnchor.constraint(equalTo: subView.safeAreaLayoutGuide.topAnchor, constant: +15)
        ])
    }

    private func configureShowMBSizeButton() {
        subView.addSubview(showMBSizeButton)
        showMBSizeButton.translatesAutoresizingMaskIntoConstraints = false
        showMBSizeButton.setTitle(" \(Constants.showMBSizeButtonName) ", for: .normal)
        showMBSizeButton.setTitleColor(.white, for: .normal)
        showMBSizeButton.clipsToBounds = true
        showMBSizeButton.layer.cornerRadius = 5
        showMBSizeButton.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        showMBSizeButton.addTarget(self, action: #selector(showMBSizeButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
            showMBSizeButton.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
            showMBSizeButton.topAnchor.constraint(equalTo: sizeOfDataLabel.safeAreaLayoutGuide.bottomAnchor, constant: +15)
        ])
    }

    private func configureShowKBSizeButton() {
        subView.addSubview(showKBSizeButton)
        showKBSizeButton.translatesAutoresizingMaskIntoConstraints = false
        showKBSizeButton.setTitle(" \(Constants.showKBSizeButtonName) ", for: .normal)
        showKBSizeButton.setTitleColor(.white, for: .normal)
        showKBSizeButton.clipsToBounds = true
        showKBSizeButton.layer.cornerRadius = 5
        showKBSizeButton.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        showKBSizeButton.addTarget(self, action: #selector(showKBSizeButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
            showKBSizeButton.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
            showKBSizeButton.topAnchor.constraint(equalTo: showMBSizeButton.safeAreaLayoutGuide.bottomAnchor, constant: +15)
        ])
    }

    @objc func showMBSizeButtonAction() {
        interactor?.convertImageDataSizeToMB(nil)
    }

    @objc func showKBSizeButtonAction() {
        interactor?.convertImageDataSizeToKB(nil)
    }
}

// Методы SizeConverterDisplayLogic
extension SizeConverterViewController: SizeConverterDisplayLogic {
    func showSizeOfData(_ viewModel: SizeViewModel) {
        DispatchQueue.main.async {
            self.sizeOfDataLabel.text = "\(viewModel.size)"
        }
    }
}
