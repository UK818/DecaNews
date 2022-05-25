//
//  BookmarksTableViewCell.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//
import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsSectionLabel: UILabel!
    @IBOutlet weak var readingTimeLabel: UILabel!
    @IBOutlet weak var newsDaysLabel: UILabel!
    @IBOutlet weak var newsHeaderLabel: UILabel!
    var removeBookmark: (() -> Void)?
    var currentBookmark: BookmarkArticle?
    var savedNews: [BookmarkArticle]?
    var viewModel: BookmarksViewModel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(index: Int) {
        loadNews()
        guard let savedNews = savedNews else {
            return
        }
        self.newsDaysLabel.text = savedNews[index].publishedAt
        self.newsHeaderLabel.text = savedNews[index].title
        let days =  Date.timeDifference(lhs: Date(), rhs: savedNews[index].publishedAt.dateChanger()).toString()
        self.newsDaysLabel.text = "\(days) ago"
        self.readingTimeLabel.text = self.viewModel.calcReadingTime(text: savedNews[index].content)
        newsImage.setImage(with: URL(string: savedNews[index].urlToImage))
    }
    
    @IBAction func bookmarkButton(_ sender: Any) {
        removeBookmark?()
    }
    func loadNews() {
        savedNews = viewModel.bookmarkArticles
    }
}
