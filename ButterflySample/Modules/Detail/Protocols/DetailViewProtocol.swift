//
//  DetailViewProtocol.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 10/03/2023.
//

import Foundation

protocol DetailViewProtocol {
    func gotImageData(_ data: Data)
    func gotError(_ error: String)
}
