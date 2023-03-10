//
//  SearchListTableViewCell.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 10/03/2023.
//

import UIKit

class SearchListTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.startAnimating()
        }
    }
    @IBOutlet weak var likeButton: UIButton!
    // MARK: - Variables
    var completionWithData: ((Data) -> Void )?
    var completionWithError: (() -> Void)?
    var id: Int?
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.posterImageView.image = nil
        completionWithData = { [weak self] (data) in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
            self?.posterImageView.image = UIImage(data: data)
            if self?.posterImageView.image == nil {
                self?.posterImageView.image = UIImage(named: "placeholder")
            }
        }
        completionWithError = {
            self.activityIndicator.isHidden = true
            self.posterImageView.image = UIImage(named: "placeholder")
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func returnReuse() -> String {
        return "searchlisttableviewcell"
    }
    
    static func returnNIB() -> UINib {
        return UINib(nibName: "SearchListTableViewCell", bundle: nil)
    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        let image = self.likeButton.imageView?.image == UIImage(systemName: "heart") ? "heart.fill" : "heart"
        if image == "heart" {
            UserDefaultConstants.likedList.removeAll(where: {
                $0 == self.id ?? 0
            })
        } else {
            UserDefaultConstants.likedList.append(self.id ?? 0)
        }
       
        UIView.animate(withDuration: 0.3, animations: {
            self.likeButton.setImage(UIImage(systemName: image), for: .normal)
        })
        
    }
    func setupData(title: String, releaseDate: String, id: Int) {
        self.titleLabel.text = title
        self.releaseDateLabel.text = releaseDate
        self.id = id
        UserDefaultConstants.likedList.forEach({
            self.likeButton.setImage(UIImage(systemName: $0 == id ? "heart.fill" : "heart"), for: .normal)
        })
    }
    
}
