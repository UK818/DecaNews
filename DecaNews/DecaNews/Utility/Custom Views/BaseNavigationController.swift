//
//  BaseNavigationController.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 07/03/2022.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewOnLoad()
    }
    
    private func setupViewOnLoad() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        
        let image = UIImage(named: "arrow-left")
        navigationBar.backIndicatorImage = image
        navigationBar.backIndicatorTransitionMaskImage = image
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
