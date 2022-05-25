//
//  DashboardTableViewCell.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
	
	@IBOutlet weak var newsImage: UIImageView!
	@IBOutlet weak var topicLabel: UILabel!
	@IBOutlet weak var newsTitle: UILabel!
	@IBOutlet weak var authorsName: UILabel!
	@IBOutlet weak var estimatedReadTime: UILabel!
	@IBOutlet weak var bookmarkBtn: UIButton!
	
	var didTapBookmarkBtn: (() -> Void)?
	var isBookmarked: Bool = false
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func setup(with article: Article, viewModel: DashboardTableViewModel?) {
        isBookmarked = viewModel?.getArticle(url: article.url) != nil
        setBookMarkImage(button: bookmarkBtn, bookMarkedStatus: isBookmarked)
		newsTitle.text = article.title
		authorsName.text = article.author
		if let articleURLString = article.urlToImage {
            newsImage.setImage(with: URL(string: articleURLString))
		}
        didTapBookmarkBtn = { [weak self] in
            (self?.isBookmarked ?? false) ?
            viewModel?.addBookMark(article: article) :
            viewModel?.deleteBookMark(url: article.url)
        }
	}
	
	@IBAction func didTapBookMarkBtn(_ sender: Any) {
		isBookmarked = !isBookmarked
        guard let button = sender as? UIButton else {
            return
        }
        setBookMarkImage(button: button, bookMarkedStatus: isBookmarked)
		didTapBookmarkBtn?()
	}
    
    private func setBookMarkImage(button: UIButton, bookMarkedStatus: Bool) {
        button.setImage(nil, for: .normal)
        button.setImage(UIImage(named: bookMarkedStatus ? "Bookmark-Fill" : "Bookmark-Outline"), for: .normal)
    }
}
