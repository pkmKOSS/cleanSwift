//  SizeConverterScreenBuilder.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import UIKit

/// Билдер сцены с конвертером размера изображения
enum SizeConverterScreenBuilder {
    static func build(imageData: SpaceImageData) -> UIViewController {
        let presenter = SizeConverterPresenter()
        let networkWorker = SizeConverterWorker()
        let interactor = SizeConverterInteractor(presenter: presenter, worker: networkWorker, dataStore: RequsetSizeModel(data: imageData.imageData))
        let router = SizeConverterRouter(dataStore: interactor)
        let viewController = SizeConverterViewController()
        presenter.viewController = viewController
        viewController.router = router
        viewController.interactor = interactor
        return viewController
    }
}
