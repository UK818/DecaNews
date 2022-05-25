import UIKit

final class PopularPublications: UICollectionViewCell {
    
    static let identifier = "PopularTopicsCollectionViewCell"
    var urlFromBase: String?
    public var newName: String?
    
    @IBOutlet var circularView: UIView?
    @IBOutlet var cellBackgroundView: UIView?
    @IBOutlet var seeMoreButton: UIButton!
    @IBOutlet var newsSource: UILabel!
    @IBOutlet var sourceLogo: UILabel!
    @IBAction func seeMoreButtonAction(_ sender: Any) {
        
        guard let urlFromBase = urlFromBase else { return }
        _ = NSURL(string: urlFromBase)
        seeMoreButton.setTitle("See More", for: .normal)
        UIApplication.shared.open(NSURL(string: urlFromBase)! as URL)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func popularPublicationsNames(_ names: String) {
        let name = names.split(separator: ",")
        let namesWithDash = names.split(separator: "-")
        let namesWithFullStop = names.split(separator: ".")
        if name.count > 0 || namesWithDash.count > 0 || namesWithFullStop.count > 0 {
            let nameAtFirstIndex = name[0]
            newName = String(nameAtFirstIndex)
            newsSource.text = newName
        }
    }
    
    public func setUp(with article: Article) {
        let sourceName = newName
        let string = sourceName?.prefix(1)
        sourceLogo.text = String(Array(string ?? "") [0])
    }
    
    func changecircularViewBorderColor() {
        let circularViewTapped = UILongPressGestureRecognizer(target: self, action: #selector(didTouchDown))
        circularViewTapped.minimumPressDuration = 0
        circularView?.addGestureRecognizer(circularViewTapped)
    }
    
    @objc func didTouchDown(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            circularView?.backgroundColor = UIColor(named: "offWhite")
            circularView?.layer.borderColor = UIColor(named: "BlueColor")?.cgColor
        } else if gesture.state == .ended || gesture.state == .cancelled {
            circularView?.backgroundColor = UIColor(named: "offWhite")
            circularView?.layer.borderColor = UIColor(named: "deepPeach")?.cgColor
        }
    }
    
    private func configureView() {
        circularView?.layer.borderWidth = 1
        circularView?.layer.borderColor = UIColor(named: "deepPeach")?.cgColor
        cellBackgroundView?.layer.borderWidth = 0.7
        cellBackgroundView?.layer.borderColor = UIColor(named: "deepGrey")?.cgColor
        newsSource.adjustsFontSizeToFitWidth = true
    }
}
