import UIKit

final class NewsDetailsViewController: UIViewController {
    
    var article: Article?
    var serviceViewModel: ServicesViewModel?
    var countClickedButtons: Int = 0
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsCategory: UIButton!
    @IBOutlet weak var newsMinuteRead: UILabel!
    @IBOutlet weak var timeFromNewsPost: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var usersName: UILabel!
    @IBOutlet weak var imageOfUser: UIImageView!
    @IBOutlet weak var likeButtons: UIButton!
    @IBOutlet weak var newsContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = UIColor(named: "themeWhite")
        newsMinuteRead.text = article?.publishedAt
        timeFromNewsPost.text = article?.source.name
        newsTitle.text = article?.title
        usersName.text = article?.author
        newsContent.text = article?.content
        usersName.adjustsFontSizeToFitWidth = true
        if let articleImage = article?.urlToImage, let imageURL = URL(string: articleImage) {
            self.newsImage.setImage(with: imageURL)
        }
    }
    
    @IBAction func bookMarkButton(_ sender: Any) {
    }
    
    @IBAction func textEditorButton(_ sender: Any) {
        
    }
    
    @IBAction func commentButton(_ sender: Any) {
        
    }
}

extension NewsDetailsViewController: Storyboardable {
    static var storyboard: Storyboard { .news }
}
