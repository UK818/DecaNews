//
//  SoonCoordinator.swift
//  DecaNews
//
//  Created by Decagon on 09/03/2022.
//

import UIKit

final class SoonCoordinator: Coordinator {

    private let navigationController: UINavigationController

    var rootViewController: UIViewController {
        navigationController
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        loadSoonViewController()
    }

    func loadSoonViewController() {
        guard let viewController = UIStoryboard(name: "Soon", bundle: nil)
                .instantiateViewController(withIdentifier: "SoonViewController") as? SoonViewController else {
                    return
                }
//        viewController.didCompleteComments = { [weak self] in
//            self?.finish()
//        }
        navigationController.pushViewController(viewController, animated: true)
    }
 }
