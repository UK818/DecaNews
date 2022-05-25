//
//  LanguageChangeCoordinator.swift
//  DecaNews
//
//  Created by Decagon on 16/03/2022.
//

import UIKit

final class LanguageChangeCoordinator: Coordinator {

    private let navigationController: UINavigationController

    var rootViewController: UIViewController {
        navigationController
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        loadLanguageChangeViewController()
    }

    func loadLanguageChangeViewController() {
        guard let viewController = UIStoryboard(name: "Settings", bundle: nil)
                .instantiateViewController(withIdentifier: "LanguageChangeViewController") as? LanguageChangeViewController else {
                    return
                }

        navigationController.pushViewController(viewController, animated: true)
    }
 }
