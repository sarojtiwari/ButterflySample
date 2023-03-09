//
//  Endpoints.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 09/03/2023.
//

import Foundation

enum Endpoints{
    case getPurchaseList
    
    // MARK: - Provides the path for the request
    var path: String {
        switch self{
        case .getPurchaseList:
                return ""
        }
    }
    
    // MARK: - Provides the method for the request
    var method: RequestMethod {
        switch self {
        case .getPurchaseList:
            return .get
        }
    }
    
    // MARK: - Provides the body for the request
    var body: [String: Any]? {
        switch self{
        case .getPurchaseList:
            return nil
        }
    }
    
    // MARK: - Provides the header for the request
    var headers: [String: String]? {
        switch self {
        case .getPurchaseList:
            return nil
        }
    }
    
    // MARK: - Provides the request
    func request() -> URLRequest {
        let url = URL(string: path)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if method == .post || method == .put {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            if let body = body {
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                } catch let error {
                    Log.error(error.localizedDescription)
                }
            }
        }
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
