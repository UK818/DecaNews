//
//  AuthCoordinator.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 14/02/2022.
//

import UIKit

final class AuthCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    override init() {
        navigationController = UINavigationController()
    }
    
    override func start() {
        loadAuthRoot()
    }
    
    func loadAuthRoot() {
        let viewController = AuthRootViewController.instantiate()
        viewController.navigateToEmailSignin = { [weak self] in
            self?.startLogin()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func startLogin() {
        let viewController = AuthComposer.makeEmailSigninController()
        viewController.navigateSignUp = { [weak self] in
            self?.startSignUp()
        }
        viewController.navigateToReset = { [weak self] in
            self?.navigateToPasswordReset()
        }
        viewController.navigateHome = { [weak self] in
            self?.finish()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func startSignUp() {
        let viewController = AuthComposer.makeEmailSignupController()
        viewController.navigateToTopics = { [weak self] in
            self?.startLogin()
        }
        viewController.navigateToEmailSignin = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToPasswordReset() {
        let viewController = AuthComposer.makePasswordResetController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func selectTopics() {
        let viewController = AuthComposer.makeSelectTopicsController()
        viewController.navigateHome = { [weak self] in
            self?.finish()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
