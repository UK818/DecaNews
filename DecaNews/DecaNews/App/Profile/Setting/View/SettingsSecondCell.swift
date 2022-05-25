//
//  SettingsSecondCell.swift
//  DecaNews
//
//  Created by Decagon on 09/03/2022.
//

import UIKit

class SettingsSecondCell: UITableViewCell {

    static let identifier = "SettingsSecondCell"
    @IBOutlet weak var Darkmodeswitch: UISwitch!

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func modeSwitch(_ sender: UISwitch) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
