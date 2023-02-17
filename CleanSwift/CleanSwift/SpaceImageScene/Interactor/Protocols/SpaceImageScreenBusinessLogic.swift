//  SpaceImageScreenBusinessLogic.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Протокол интерактора сцены с изображением космоса
protocol SpaceImageScreenBusinessLogic {
    func fetchSpaceImageDescription(_ request: SpaceImageModel.FetchSpaceImageDescription.Request)
    func fetchSpaceImageData(_ request: SpaceImageModel.FetchSpaceImageData.Request)
}
