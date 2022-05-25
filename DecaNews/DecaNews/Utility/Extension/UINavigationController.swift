//
//  UINavigationController.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 07/03/2022.
//

import UIKit

extension UINavigationController {
    
    func setBlackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = nil
        navigationBar.tintColor = .black
        navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func setWhiteBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = nil
        navigationBar.tintColor = .white
        navigationBar.topItem?.backBarButtonItem = backButton
    }
}
