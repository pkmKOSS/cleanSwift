//  SizeConverterBusinessLogic.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Протокол сцены с конвертером размера изображения
protocol SizeConverterBusinessLogic {
    func convertImageDataSizeToKB(_ request: RequsetSizeModel?)
    func convertImageDataSizeToMB(_ request: RequsetSizeModel?)
}
