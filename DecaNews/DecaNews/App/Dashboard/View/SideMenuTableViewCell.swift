//
//  ProfileTableViewCell.swift
//  DecaNews
//
//  Created by Decagon on 09/02/2022.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
	@IBAction func viewProfileButtonAction(_ sender: Any) {
	}
}
