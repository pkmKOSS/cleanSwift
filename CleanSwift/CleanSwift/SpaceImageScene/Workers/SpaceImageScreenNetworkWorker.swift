//  SpaceImageScreenNetworkWorker.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Воркер сцены с изображением космоса
final class SpaceImageScreenNetworkWorker {

    // MARK: - Private constants

    private enum Constants {
        static let defaultURL = "https://go-apod.herokuapp.com/apod"
    }

    // MARK: - Private properteis

    private let networkSerivce: NetworkServiceProtocol

    // MARK: Init

    init(networkSerivce: NetworkServiceProtocol) {
        self.networkSerivce = networkSerivce
    }
}

/// SpaceImageScreenNetworkWorkerLogic methods
extension SpaceImageScreenNetworkWorker: SpaceImageScreenNetworkWorkerLogic {
    func fetchSpaceImageData(urlString: String, completion: @escaping (FetchImageDataResult) -> Void) {
        networkSerivce.getImage(urlString: urlString) { result in
            completion(result)
        }
    }

    func fetchSpaceImageDescription(completion: @escaping (FetchImageDescriptionResult) -> Void) {
        networkSerivce.fetchImageDescription(urlString: Constants.defaultURL, model: SpaceImageDescription.self) { result in
            completion(result)
        }
    }
}
