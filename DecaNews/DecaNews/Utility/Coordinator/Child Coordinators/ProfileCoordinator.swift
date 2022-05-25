//
//  ProfileCoordinator.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 16/03/2022.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        loadRootProfileScene()
    }
    
    func loadRootProfileScene() {
        let viewController = ProfileViewController.instantiate()
        viewController.shouldEditProfile = { [weak self] in
            self?.editProfile()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func editProfile() {
        let viewController = EditProfileViewController.instantiate()
        navigationController.pushViewController(viewController, animated: true)
    }
}
