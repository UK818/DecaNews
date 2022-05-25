//
//  LatestNewsTableViewCell.swift
//  DecaNews
//
//  Created by mac on 10/02/2022.
//

import UIKit

class LatestNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var authorsName: UILabel!
    @IBOutlet weak var bookmark: UIImageView!
    
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
        authorsName?.text = article.author
        if let articleURLString = article.urlToImage {
            newsImage.setImage(with: URL(string: articleURLString))
        }
    }
}
