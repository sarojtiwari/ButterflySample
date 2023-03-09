//
//  HTTPClient.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 09/03/2023.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T:Decodable>(endpoint: Endpoints,
                                  responseModel: T.Type,
                                  completion: @escaping (Result<T, Error>) -> Void)
    
    
}


extension HTTPClient {
    func sendRequest<T:Decodable>(endpoint: Endpoints,
                                  responseModel: T.Type,
                                  completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = endpoint.request()
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                if let error = error {
                    Log.error(endpoint.path + error.localizedDescription)
                    completion(.failure(error))
                } else {
                    Log.error(endpoint.path)
                    completion(.failure(NetworkError.invalidData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(responseModel, from: data)
                Log.success(endpoint.path)
                completion(.success(result))
            } catch let decodingError {
                Log.error(endpoint.path + decodingError.localizedDescription)
                completion(.failure(decodingError))
            }
        }.resume()
    }
}
