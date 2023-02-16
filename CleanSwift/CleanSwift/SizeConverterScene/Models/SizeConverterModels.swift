//  SizeConverterModel.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import Foundation

typealias RequsetSizeModel = SizeConverterModel.ConvertSize.Requset
typealias ResponseSizeModel = SizeConverterModel.ConvertSize.Response
typealias SizeViewModel = SizeConverterModel.ConvertSize.ViewModel

/// Модель конвертера размера изображения
enum SizeConverterModel {
    enum ConvertSize {
        struct Requset {
            let data: Data
        }
        struct Response {
            let data: Data
        }
        struct ViewModel {
            let size: String
        }
    }
}
