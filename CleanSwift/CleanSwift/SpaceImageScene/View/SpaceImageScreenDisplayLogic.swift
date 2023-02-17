//  SpaceImageScreenDisplayLogic.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Протокол контроллера сцены с изображением космоса
protocol SpaceImageScreenDisplayLogic {
    func displaySpaceImageDescroption(_ viewModel: DescriptionViewModel)
    func displaySpaceImage(_ viewModel: ImageDataViewModel)
}
