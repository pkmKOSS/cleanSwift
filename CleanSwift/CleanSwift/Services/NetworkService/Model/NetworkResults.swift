//  NetworkResults.swift
//  Created by Григоренко Александр Игоревич on 17.02.2023.

/// Результат обращения к веб сервису за описанием изображения
enum FetchImageDescriptionResult {
    case succes(description: Codable)
    case failure(error: Error?)
}

/// Результат обращения к веб сервису с кинофильмами.
enum FetchImageDataResult {
    case success(data: Codable)
    case failure(error: Error?)
}
