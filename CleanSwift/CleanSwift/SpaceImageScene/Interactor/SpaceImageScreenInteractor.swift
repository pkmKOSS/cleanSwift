//  SpaceImageScreenInteractor.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import Foundation

/// Интерактор сцены с изображением космоса
final class SpaceImageScreenInteractor {

    // MARK: - Public properties

    var dataStore: [SpaceImageData] = []

    // MARK: - Private properties

    private let networkWorker: SpaceImageScreenNetworkWorkerLogic
    private let presenter: SpaceImageScreenPresentationLogic

    // MARK: - init

    init(networkWorker: SpaceImageScreenNetworkWorkerLogic, presenter: SpaceImageScreenPresentationLogic) {
        self.networkWorker = networkWorker
        self.presenter = presenter
    }

}

/// Методы SpaceImageScreenDataStoreProtocol
extension SpaceImageScreenInteractor: SpaceImageScreenBusinessLogic, SpaceImageScreenDataStore {

    func fetchSpaceImageDescription(_ request: RequestDescriptionModel) {
        networkWorker.fetchSpaceImageDescription { [ weak self ] result in
            switch result {
                case .succes(let imageDescription):
                    guard let description = imageDescription as? SpaceImageDescription else { return }
                    self?.presenter.prepareSpaceImageDescription(ResponseDescriptionModel(spaceImage: description))
                case .failure(_):
                    break
            }
        }
    }

    func fetchSpaceImageData(_ request: RequestDataModel) {
        networkWorker.fetchSpaceImageData(urlString: request.url) { [weak self ] result in
            switch result {
                case .success(let data):
                    guard let data = data as? Data else { return }
                    self?.dataStore.append(SpaceImageData(imageData: data))
                    self?.presenter.prepareSpaceImageData(ResponseDataModel(spaceImageData: data))
                case .failure(_):
                    break
            }
        }
    }
}
