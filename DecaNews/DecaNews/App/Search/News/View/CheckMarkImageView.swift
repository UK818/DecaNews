//
//  CheckMarkImageView.swift
//  DecaNews
//
//  Created by Decagon on 15/02/2022.
//

import UIKit

class CheckMarkImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    init() {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        image = UIImage(systemName: "checkmark")
        tintColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCheckMark(_ state: Bool) {
        image = state ? UIImage(systemName: "checkmark") : nil
    }
    
}
