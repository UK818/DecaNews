//
//  PasswordChangeCoordinator.swift
//  DecaNews
//
//  Created by Geniusjames on 16/02/2022.
//

import UIKit

final class PasswordChangeCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        loadPasswordChangeViewController()
    }

    func loadPasswordChangeViewController() {
        guard let viewController = UIStoryboard(name: "Profile", bundle: nil)
                .instantiateViewController(withIdentifier: "PasswordChangeViewController") as? PasswordChangeViewController else {
                    return
                }
        viewController.didCompletePasswordChange = { [weak self] in
            self?.finish()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
