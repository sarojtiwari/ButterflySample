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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            self.activityIndicator.isHidden = true
        }
    }
    
    // MARK: - Variables
    var viewModel: SearchListViewModelProtocol?
    var movieList: [SearchListModel]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    var coordinator: MainCoordinator?
    var lastQueried = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.title = "Search For Movies"
        self.searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Search For Movies"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
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
        cell?.setupData(title: currentData.title, releaseDate:currentData.releaseDate, id: currentData.id)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentData = self.movieList?[indexPath.row] else {
            return
        }
        self.coordinator?.gotoMovieList(currentData)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let movies = self.movieList else {
            return
        }
        if indexPath.row == movies.count - 1 {
            if viewModel?.moreDataAvailable ?? false {
                self.activityIndicator.startAnimating()
                self.activityIndicator.isHidden = false
                viewModel?.getList(query: self.lastQueried)
            }
        }
    }
}

// MARK: - Search Bar Delegate
extension SearchListView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0 {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            self.lastQueried = searchText.replacingOccurrences(of: " ", with: "+")
            self.viewModel?.currentPage = 1
            self.movieList = nil
            viewModel?.getList(query: lastQueried)
        } else if searchText.count == 0 {
            self.movieList = nil
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.lastQueried = ""
        self.viewModel?.currentPage = 1
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
}


// MARK: - View Protocol
extension SearchListView: SearchListViewProtocol {
    func gotList(_ list: [SearchListModel]) {
        if self.movieList == nil {
            self.movieList = list
        } else {
            list.forEach({
                self.movieList?.append($0)
            })
        }
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
    func gotError(_ error: String) {
        self.activityIndicator.stopAnimating()
        self.showAlert(message: error)
        self.activityIndicator.isHidden = true
    }
}

// MARK: - Conforming to Storyboarding

extension SearchListView: Storyboarding {}
