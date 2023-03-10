//
//  DetailViewModel.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 10/03/2023.
//

import Foundation

class DetailViewModel: DetailViewModelProtocol {
    
    // MARK: - Variables
    var service: DetailServiceProtocol
    var viewType: DetailViewProtocol?
    
    // MARK: - Initialization
    init(_ withService: DetailServiceProtocol) {
        self.service = withService
    }
    
    func getImage(_ image: String) {
        guard let imageUrl = URL(string: Constants.imageURL + image) else {
            return
        }
        self.service.downloadImage(url: imageUrl) {[weak self] (data) in
            DispatchQueue.main.async {
                self?.viewType?.gotImageData(data)
            }
        } failure: { [weak self] (error) in
            DispatchQueue.main.async {
                self?.viewType?.gotError(error.localizedDescription)
            }
        }

    }
    
}
