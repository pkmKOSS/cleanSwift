//  SpaceImageScreenDataStoreProtocol.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Протокол хранения данных в сцене с изображением космоса
protocol SpaceImageScreenDataStore {
    var dataStore: [SpaceImageData] { get }
}
