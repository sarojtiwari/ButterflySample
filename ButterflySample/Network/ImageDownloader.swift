//
//  ImageDownloader.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 10/03/2023.
//

import Foundation
protocol ImageDownlader {
    func downloadImage(url: URL, success: @escaping(Data) -> (), failure: @escaping(Error) -> ())
}


extension ImageDownlader {
    func downloadImage(url: URL, success: @escaping(Data) -> (), failure: @escaping(Error) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                Log.error(error!.localizedDescription)
                return failure(error!)
            }
            if let data = data {
                success(data)
            }
        }.resume()
    }
}
