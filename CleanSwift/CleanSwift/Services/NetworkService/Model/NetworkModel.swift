//  NetworkModel.swift
//  Created by Григоренко Александр Игоревич on 17.02.2023.

import Foundation

/// Описание изображения космоса
struct SpaceImageDescription: Codable {
    /// Дата снимка, описание
    let date, explanation: String
    /// Ссылка на HD изображение
    let hdurl: String
    /// Название изображения
    let title: String
    /// Ссылка на изображение
    let url: String
}

/// Изображение космоса
struct SpaceImageData: Codable {
    /// Data изображения космоса
    let imageData: Data
}
