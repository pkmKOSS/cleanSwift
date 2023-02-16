//  SpaceImageScreenModel.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import Foundation

typealias RequestDescriptionModel = SpaceImageModel.FetchSpaceImageDescription.Request
typealias RequestDataModel = SpaceImageModel.FetchSpaceImageData.Request

typealias ResponseDescriptionModel = SpaceImageModel.FetchSpaceImageDescription.Response
typealias ResponseDataModel = SpaceImageModel.FetchSpaceImageData.Response

typealias DescriptionViewModel = SpaceImageModel.FetchSpaceImageDescription.ViewModel
typealias ImageDataViewModel = SpaceImageModel.FetchSpaceImageData.ViewModel

/// Модель сцены с изображением космоса
enum SpaceImageModel {
    /// Модель данных об изображении космоса
    enum FetchSpaceImageDescription {
        struct Request {}
        struct Response {
            let spaceImage: SpaceImageDescription
        }
        struct ViewModel {
            let spaceImage: SpaceImageDescription
        }
    }

    /// Модель изображения космоса
    enum FetchSpaceImageData {
        struct Request {
            let url: String
        }
        struct Response {
            let spaceImageData: Data
        }
        struct ViewModel {
            let spaceImageData: Data
        }
    }
}
