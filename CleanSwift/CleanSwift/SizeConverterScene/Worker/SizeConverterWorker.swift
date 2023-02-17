//  SizeConverterWorker.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

import Foundation

/// Воркер сцены с конвертером размера изображения
final class SizeConverterWorker: SizeConverterWorkingLogic {
    // MARK: - Public methods

    func convertImageDataSizeToMB(_ request: RequsetSizeModel, completion: @escaping (String) -> Void) {
        let sizeOfData = request.data.count
        let byteFormatter = ByteCountFormatter()
        byteFormatter.allowedUnits = [.useMB]
        byteFormatter.countStyle = .file
        let sizeOfDataInMB = byteFormatter.string(fromByteCount: Int64(sizeOfData))
        completion(sizeOfDataInMB)
    }

    func convertImageDataSizeToKB(_ request: RequsetSizeModel, completion: @escaping (String) -> Void) {
        let sizeOfData = request.data.count
        let byteFormatter = ByteCountFormatter()
        byteFormatter.allowedUnits = [.useKB]
        byteFormatter.countStyle = .file
        let sizeOfDataInKB = byteFormatter.string(fromByteCount: Int64(sizeOfData))
        completion(sizeOfDataInKB)
    }
}
