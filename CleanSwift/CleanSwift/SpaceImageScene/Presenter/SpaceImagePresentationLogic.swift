//  SpaceImagePresentationLogic.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Протокол презентера сцены с изображением космоса
protocol SpaceImageScreenPresentationLogic {
    func prepareSpaceImageDescription(_ response: ResponseDescriptionModel)
    func prepareSpaceImageData(_ response: ResponseDataModel)
}
