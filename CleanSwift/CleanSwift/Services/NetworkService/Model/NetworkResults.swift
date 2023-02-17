//  NetworkResults.swift
//  Created by Григоренко Александр Игоревич on 17.02.2023.

/// Результат обращения к веб сервису за описанием изображения
enum FetchImageDescriptionResult {
    case succes(description: Decodable)
    case failure(error: Error?)
}

/// Результат обращения к веб сервису с кинофильмами.
enum FetchImageDataResult {
    case success(data: Decodable)
    case failure(error: Error?)
}
