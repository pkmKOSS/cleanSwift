//  SpaceImageScreenRouter.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import UIKit

/// Роутер сцены с изображением космоса
final class SpaceImageScreenRouter {
    // MARK: - Public properties

    weak var viewController: UIViewController?
    var dataStore: SpaceImageScreenDataStore

    // MARK: - Init

    init(dataStore: SpaceImageScreenDataStore) {
        self.dataStore = dataStore
    }
}

/// Методы SpaceImageScreenRoutingLogic
extension SpaceImageScreenRouter: SpaceImageScreenRoutingLogic {
    func routToConverterScene() {
        guard let data = dataStore.dataStore.first else { return }
        let viewController = SizeConverterScreenBuilder.build(imageData: data)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
