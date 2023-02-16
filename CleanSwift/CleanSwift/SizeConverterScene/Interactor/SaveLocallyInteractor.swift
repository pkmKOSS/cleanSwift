//  SizeConverterInteractor.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Интерактор сцены с конвертером размера изображения
final class SizeConverterInteractor: SizeConverterBusinessLogic, SizeConverterDataStore {

    // MARK: - Public properties

    var dataStore: RequsetSizeModel

    // MARK: - Private properties

    private let presenter: SizeConverterPresentingLogic
    private let worker: SizeConverterWorkingLogic

    // MARK: - Init

    init(presenter: SizeConverterPresentingLogic, worker: SizeConverterWorkingLogic, dataStore: RequsetSizeModel) {
        self.presenter = presenter
        self.worker = worker
        self.dataStore = dataStore
    }

    // MARK: - Public methods

    func convertImageDataSizeToKB(_ request: RequsetSizeModel?) {
        worker.convertImageDataSizeToKB(dataStore) { [ weak self ] size in
            self?.presenter.prepareDataSizeToShow(size: size)
        }
    }

    func convertImageDataSizeToMB(_ request: RequsetSizeModel?) {
        worker.convertImageDataSizeToMB(dataStore) { [ weak self ] size in
            self?.presenter.prepareDataSizeToShow(size: size)
        }
    }
}
