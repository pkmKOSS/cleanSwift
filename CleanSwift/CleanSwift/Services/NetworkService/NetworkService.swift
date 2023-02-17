//  NetworkService.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import Foundation

/// Сервис для работы с сетью
final class NetworkService: NetworkServiceProtocol {

    // MARK: - Private properties

    private let decoder = JSONDecoder()

    // MARK: - Public methods

    func fetchImageDescription<T: Decodable>(
        urlString: String,
        model: T.Type,
        completion: @escaping (FetchImageDescriptionResult) -> Void
    ) {
        guard let url = URL(string: urlString) else { return }

        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard
                let self = self,
                let cinematics = try? self.decoder.decode(model.self, from: data ?? Data())
            else { return }
            let result = FetchImageDescriptionResult.succes(description: cinematics)
            completion(result)
            if let error = error {
                completion(FetchImageDescriptionResult.failure(error: error))
            }
        }.resume()
    }

    func getImage(
        urlString: String,
        completion: @escaping (FetchImageDataResult) -> Void
    ) {
        guard let url = URL(string: urlString) else { return }

        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                let result = FetchImageDataResult.success(data: data)
                completion(result)
            } else if let error = error {
                let result = FetchImageDataResult.failure(error: error)
                completion(result)
            }
        }.resume()
    }
}
