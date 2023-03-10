//
//  SearchListViewModelProtocol.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 10/03/2023.
//

import Foundation

protocol SearchListViewModelProtocol {
    func getList(query: String)
    func getImage(image: String,
                  completion: @escaping(Data) -> Void,
                  failure: @escaping(Error) -> ())
    var moreDataAvailable:Bool {get set}
    var currentPage:Int{get set}
}
