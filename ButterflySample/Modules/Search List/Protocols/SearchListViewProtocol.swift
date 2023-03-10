//
//  SearchListViewProtocol.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 10/03/2023.
//

import Foundation

protocol SearchListViewProtocol {
    func gotList(_ list: [SearchListModel])
    func gotError(_ error: String)
}
