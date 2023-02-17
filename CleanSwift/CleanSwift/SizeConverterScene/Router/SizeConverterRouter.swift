//  SizeConverterRouter.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import UIKit

/// Роутер сцены с конвертером размера изображения
final class SizeConverterRouter: SizeConverterRoutingLogic, SizeConverterDataPassing {

    // MARK: - public properties

    weak var viewController: UIViewController?
    var dataStore: SizeConverterDataStore

    // MARK: - Init

    init(dataStore: SizeConverterDataStore) {
        self.dataStore = dataStore
    }
}
