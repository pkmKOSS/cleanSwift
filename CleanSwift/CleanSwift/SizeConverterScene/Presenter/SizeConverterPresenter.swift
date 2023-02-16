//  SizeConverterPresenter.swift
//  Created by Григоренко Александр Игоревич on 16.02.2023.

/// Презентер сцены с конвертером размера изображения
final class SizeConverterPresenter: SizeConverterPresentingLogic {

    // MARK: - Publoc properties
    
    var viewController: SizeConverterDisplayLogic?

    // MARK: - Public methods

    func prepareDataSizeToShow(size: String) {
        let formattedString = size.uppercased()
        viewController?.showSizeOfData(SizeViewModel(size: formattedString))
    }
}
