//  SpaceImageScreenNetworkWorkerLogic.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Протокол воркера работы с сетью
protocol SpaceImageScreenNetworkWorkerLogic {
    func fetchSpaceImageDescription(completion: @escaping (FetchImageDescriptionResult) -> Void)
    func fetchSpaceImageData(urlString: String ,completion: @escaping (FetchImageDataResult) -> Void)
}
