//  SpaceImagePresenter.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Презентер сцены с изображением космоса
final class SpaceImageScreenPresenter {
    // MARK: - Public properties

    var viewController: SpaceImageScreenDisplayLogic?
}

/// Методы SpaceImageScreenPresentationLogic
extension SpaceImageScreenPresenter: SpaceImageScreenPresentationLogic {
    func prepareSpaceImageDescription(_ response: ResponseDescriptionModel) {
        viewController?.displaySpaceImageDescroption(DescriptionViewModel(spaceImage: response.spaceImage))
    }

    func prepareSpaceImageData(_ response: ResponseDataModel) {
        viewController?.displaySpaceImage(ImageDataViewModel(spaceImageData: response.spaceImageData))
    }
}
