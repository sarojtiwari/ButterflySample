//
//  PurchaseListViewController.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 09/03/2023.
//

import UIKit

class SearchListView: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var viewModel: SearchListViewModelProtocol?
    var movieList: [SearchListModel]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.title = "Search For Movies"
        self.searchBar.delegate = self
    }
    
    private func setupTableView() {
        self.tableView.register(SearchListTableViewCell.returnNIB(), forCellReuseIdentifier: SearchListTableViewCell.returnReuse())
        tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}


// MARK: - TableView Delegate
extension SearchListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - TableView Datasource
extension SearchListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchListTableViewCell.returnReuse(), for: indexPath) as? SearchListTableViewCell
        guard let currentData = self.movieList?[indexPath.row] else {
            return cell ?? UITableViewCell()
        }
        self.viewModel?.getImage(image: currentData.posterPath ?? "", completion: { data in
            cell?.completionWithData?(data)
        }, failure: { error in
            cell?.completionWithError?()
        })
        cell?.setupData(title: currentData.title, releaseDate:currentData.releaseDate)
        return cell ?? UITableViewCell()
        
    }
}

// MARK: - Search Bar Delegate
extension SearchListView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 1 {
            viewModel?.getList(query: searchText.replacingOccurrences(of: " ", with: ""))
        } else {
            self.movieList = nil
        }
    }
}


// MARK: - View Protocol
extension SearchListView: SearchListViewProtocol {
    func gotList(_ list: [SearchListModel]) {
        self.movieList = list
    }
    
    func gotError(_ error: String) {
        debugPrint("Error Noted \(error)")
    }
}

// MARK: - Conforming to Storyboarding

extension SearchListView: Storyboarding {}
