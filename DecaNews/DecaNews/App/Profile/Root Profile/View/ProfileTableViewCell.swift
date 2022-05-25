//
//  ProfileTableViewCell.swift
//  DecaNews
//
//  Created by mac on 16/02/2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    
    var didTapBookmarkBtn: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func bookmarkButtonAction(_ sender: Any) {
        didTapBookmarkBtn?()
    }
    
    func setup(with article: Article) {
        newsTitle?.text = article.title
        if let articleURLString = article.urlToImage,
           let catImageURL = URL(string: articleURLString) {
            newsImage.setImage(with: catImageURL)
        }
    }
}
