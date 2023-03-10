//
//  ListTest.swift
//  ButterflySampleTests
//
//  Created by Saroj Tiwari on 11/03/2023.
//

import XCTest

@testable import ButterflySample

class ListTests: XCTestCase {
    
    var service:SearchListService!
    
    override func setUpWithError() throws {
        self.service = SearchListService()
    }

    override func tearDownWithError() throws {
        self.service = nil
    }
    
    func testPagination() {
        let movieListViewModel = SearchListViewModel(service)
        let searchModel = SearchListDataModel(page: 1, results: [], total_pages: 2)
        movieListViewModel.currentPage = 1
        movieListViewModel.moreDataAvailable = true
        XCTAssertEqual(movieListViewModel.moreDataAvailable, movieListViewModel.currentPage < searchModel.total_pages)
    }
    
    
}
