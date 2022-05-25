//
//  UIImage+Extension.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 17/03/2022.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(with url: URL?) {
        self.sd_setImage(with: url, placeholderImage: UIImage(named: "avatar_overlay"), options: [], context: nil)
    }
}
