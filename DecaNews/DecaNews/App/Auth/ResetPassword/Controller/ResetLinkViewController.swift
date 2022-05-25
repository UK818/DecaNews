//
//  resetPassWordViewController.swift
//  DecaNews
//
//  Created by Decagon on 02/02/2022.
//

import UIKit

class ResetLinkViewController: UIViewController {
    var navigateToEmailSignin: (() -> Void)?
    
override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginScreen(_ sender: Any) {
        navigateToEmailSignin?()
    }
}

extension ResetLinkViewController: Storyboardable {
    static var storyboard: Storyboard { .auth }
}
