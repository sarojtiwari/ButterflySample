//
//  SearchListViewModel.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 10/03/2023.
//

import Foundation

class SearchListViewModel: SearchListViewModelProtocol {
    // MARK: - Variables
    var service: SearchListServiceProtocol
    var viewType: SearchListViewProtocol?
    
    // MARK: - Initialization
    init(_ withService: SearchListServiceProtocol) {
        self.service = withService
    }
    
    func getList(query: String) {
        service.getMovieList(query: query) { [weak self] (list) in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.viewType?.gotList(list.results)
            }
        } error: { [weak self] (error) in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.viewType?.gotError(error.localizedDescription)
            }
        }
    }
    
    func getImage(image: String,
                  completion: @escaping(Data) -> Void,
                  failure: @escaping(Error) -> ()) {
        guard let imageUrl = URL(string: Constants.imageURL + image) else {
            return
        }
        service.downloadImage(url: imageUrl) { data in
            DispatchQueue.main.async {
                completion(data)
            }
        } failure: { error in
            DispatchQueue.main.async {
                failure(error)
            }
        }
    }
    
}
