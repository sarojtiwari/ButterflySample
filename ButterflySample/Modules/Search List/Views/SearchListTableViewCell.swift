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
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
}
