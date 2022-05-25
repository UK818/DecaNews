import UIKit

class NewsTopicsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsTopicsCollectionViewCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var newsGenre: UILabel!
    @IBOutlet var circularBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newsGenre.sizeToFit()
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        self.newsGenre.isUserInteractionEnabled = true
        self.newsGenre.addGestureRecognizer(labelTap)
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        print("labelTapped")
    }
    
    func setup(with topics: Topics) {
        imageView.image = topics.image
        newsGenre.text = topics.title
    }
}
