//  SpaceImageScreenBuilder.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import UIKit

/// Билдер экрана с изображением космоса
enum SpaceImageScreenBuilder {
    static func build() -> SpaceImageScreenViewController {
        let presenter = SpaceImageScreenPresenter()
        let networkService = NetworkService()
        let networkWorker = SpaceImageScreenNetworkWorker(networkSerivce: networkService)
        let interactor = SpaceImageScreenInteractor(networkWorker: networkWorker, presenter: presenter)
        let router = SpaceImageScreenRouter(dataStore: interactor)
        let viewController = SpaceImageScreenViewController()
        presenter.viewController = viewController
        viewController.router = router
        router.viewController = viewController
        viewController.interactor = interactor
        return viewController
    }
}
