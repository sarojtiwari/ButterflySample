//
//  DetailView.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 10/03/2023.
//

import UIKit

class DetailView: UIViewController {
    
    // MARK: - Variables
    var viewModel: DetailViewModelProtocol?
    var model: SearchListModel?
    var image: UIImage?
    
    // MARK: - IBOutlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.startAnimating()
        }
    }
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let model = model else {
            return
        }
        self.setupData(model)
    }
    
    private func setupData(_ data: SearchListModel) {
        self.languageLabel.text = data.originalLanguage
        self.titleLabel.text = data.title
        self.dateLabel.text = data.releaseDate
        self.voteCountLabel.text = String(data.voteCount)
        self.overviewLabel.text = data.overview
        self.title = data.title
        viewModel?.getImage(data.posterPath ?? "")
    }
    
}

// MARK: - View Protocol
extension DetailView: DetailViewProtocol {
    func gotImageData(_ data: Data) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.posterImageView.image = UIImage(data: data)
        if self.posterImageView.image == nil {
            self.posterImageView.image = UIImage(named: "placeholder")
        }
    }
    
    func gotError(_ error: String) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.posterImageView.image = UIImage(named: "placeholder")
        self.showAlert(message: error)
    }
    
    
}

// MARK: - Conforming to Storyboarding
extension DetailView: Storyboarding {
    
}
