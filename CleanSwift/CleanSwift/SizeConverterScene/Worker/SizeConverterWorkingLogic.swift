//  SizeConverterWorkingLogic.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import Foundation

/// Протокол воркера сцены с конвертером размера изображения
protocol SizeConverterWorkingLogic {
    func convertImageDataSizeToKB(_ request: RequsetSizeModel, completion: @escaping (String) -> Void)
    func convertImageDataSizeToMB(_ request: RequsetSizeModel, completion: @escaping (String) -> Void)
}
