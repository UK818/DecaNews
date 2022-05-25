//
//  UIViewController+Extension.swift
//  DecaNews
//
//  Created by Geniusjames on 16/03/2022.
//

import UIKit

extension UIViewController {
    
     func alert(message: String, title: String) {
       
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                self.present(alert, animated: true, completion: nil)
    }
}
