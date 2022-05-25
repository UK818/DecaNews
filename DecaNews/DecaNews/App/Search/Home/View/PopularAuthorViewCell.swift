import UIKit

class PopularAuthorViewCell: UICollectionViewCell {
    
    static let identifier = "ThirdCollectionViewCell"
    var seePostFromAuthor: String?
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var topBackgroundImage: UIImageView!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var authorName: UILabel!
    @IBOutlet var seePostButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configuresView()
    }
    
    @IBAction func seePostActionButton(_ sender: Any) {
        
        guard let urlFromBase = seePostFromAuthor else { return }
        _ = NSURL(string: urlFromBase)
        seePostButton.setTitle("See Post", for: .normal)
        UIApplication.shared.open(NSURL(string: urlFromBase)! as URL)
    }
    
    func configuresView() {
        authorName.adjustsFontSizeToFitWidth = true
        containerView.layer.borderWidth = 0.7
        containerView.layer.borderColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1).cgColor
    }
    
    func giveMeFullName(_ names: String) {
        let name = names.split(separator: ",")
        if name.count > 0 {
            let nameAtFirstIndex = name[0]
            let newName = String(nameAtFirstIndex)
            authorName.text = newName
        }
    }
}
