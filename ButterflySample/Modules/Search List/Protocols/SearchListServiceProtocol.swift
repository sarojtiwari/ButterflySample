//
//  SearchListServiceProtocol.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 10/03/2023.
//

import Foundation

protocol SearchListServiceProtocol:ImageDownlader {
    func getMovieList(query: String,
                      completion: @escaping(SearchListDataModel) -> Void,
                      error: @escaping(Error) -> Void)
}

extension SearchListServiceProtocol {
    func getMovieList(query: String,
                      completion: @escaping(SearchListDataModel) -> Void,
                      error: @escaping(Error) -> Void) {
        NetworkManager.shared.sendRequest(endpoint: Endpoints.getMovieList(query: query), responseModel: SearchListDataModel.self) { result in
            switch result {
            case .success(let success):
                completion(success)
            case .failure(let failure):
                error(failure)
            }
        }
    }
}
