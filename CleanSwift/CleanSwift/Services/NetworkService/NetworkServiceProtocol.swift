//  NetworkServiceProtocol.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Протокол работы с сетью
protocol NetworkServiceProtocol {
    func fetchImageDescription<T: Codable>(
        urlString: String,
        model: T.Type,
        completion: @escaping (FetchImageDescriptionResult) -> Void
    )

    func getImage(
        urlString: String,
        completion: @escaping (FetchImageDataResult) -> Void
    )
}
