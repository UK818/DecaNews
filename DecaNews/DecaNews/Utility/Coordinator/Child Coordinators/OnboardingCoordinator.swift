//
//  OnboardingCoordinator.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 14/02/2022.
//

import UIKit

final class OnboardingCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    override init() {
        navigationController = UINavigationController()
    }
    
    override func start() {
        loadOnboardingRoot()
    }
    
    func loadOnboardingRoot() {
        let viewController = OnboardingViewController.instantiate()
        let viewModel = DIContainer.makeOnboardingViewModel()
        viewController.viewModel = viewModel
        viewController.didCompleteOnboarding = { [weak self] in
            self?.finish()
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
