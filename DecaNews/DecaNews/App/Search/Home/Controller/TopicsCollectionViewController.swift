import UIKit

class TopicsCollectionViewController: UIViewController {
    
    public var serviceViewModel: ServicesViewModel?
    public var collectionViewNews: [Article]?
    public var authorsCollectionViewNews: [Article]?
    let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=b48f157c6a94447bbaba425d8774fde3"
    private let urls = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b48f157c6a94447bbaba425d8774fde3"
    let publications = PopularPublications()
    let authorsCollectionView = PopularAuthorViewCell()
    var red = UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
    
    @IBOutlet weak var searchBarField: UITextField!
    @IBOutlet weak var circularCollectionView: UICollectionView!
    @IBOutlet weak var cardShapedCollectionView: UICollectionView!
    @IBOutlet weak var authorsCardShapedCollectionView: UICollectionView!
    @IBOutlet weak var clickToSeeMoreAuthorSButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchDataTocell(url: url)
        fetchDataToThirdCell(url: urls)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func seeMoreAuthorsActionButton(_ sender: Any) {
        
    }
    
    private func fetchDataTocell(url: String) {
        NetworkManager().networkRequest(url: url) {[weak self] response in
            self?.collectionViewNews = response.articles
            DispatchQueue.main.async {
                self?.cardShapedCollectionView.reloadData()
            }
        } errorCompletion: { error in
            print("This is the error displayed: ", error)
        }
    }
    
    private func fetchDataToThirdCell(url: String) {
        NetworkManager().networkRequest(url: url) {[weak self] response in self?.authorsCollectionViewNews = response.articles
            DispatchQueue.main.async {
                self?.authorsCardShapedCollectionView.reloadData()
            }
        } errorCompletion: { error in
            print(error, ": An error has been made please check")
        }
    }
    
    func configureView() {
        searchBarField.autocapitalizationType = .none
        searchBarField.autocorrectionType = .no
        searchBarField.returnKeyType = .search
        searchBarField.leftViewMode = UITextField.ViewMode.always
        searchBarField.isUserInteractionEnabled = true
    }
}

extension TopicsCollectionViewController: Storyboardable {
    static var storyboard: Storyboard { .search }
}
