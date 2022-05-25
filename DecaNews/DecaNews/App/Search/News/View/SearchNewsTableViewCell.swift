//
//  SearchNewsTableViewCell.swift
//  DecaNews
//
//  Created by Decagon on 15/02/2022.
//

import UIKit

class SearchNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var readTimeLabel: UILabel!
    @IBOutlet weak var daysAgoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var profilePictureImgView: UIImageView!
    @IBOutlet weak var bookMarkImage: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func bookMarkAction(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(cellData: Article, category: String) {
        guard let publishedDate = cellData.publishedAt else { return }
        titleLabel.text = cellData.title
        categoryLabel.text = category
        readTimeLabel.text = "\(2) mins read"
        daysAgoLabel.text = (Date() - publishedDate.dateChanger()).toString()
        if let cellImage = cellData.urlToImage, let url = URL(string: cellImage) {
            profilePictureImgView.setImage(with: url)
        }
        bookMarkImage.setTitle("", for: .normal)
    }

}
