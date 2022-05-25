//
//  MainCoordinator.swift
//  DecaNews
//
//  Created by Decagon on 16/01/2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private var navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }
    
    override func start() {
        let userStore = DIContainer.makeUserStore()
        userStore.isUserOnboarded ? autenticateUser() : startOnboarding()
    }
    
    func startOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator()
        pushCoordinator(onboardingCoordinator)
        window.rootViewController = onboardingCoordinator.rootViewController
        window.makeKeyAndVisible()
        
        onboardingCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
            self?.autenticateUser()
        }
    }
    
    private func autenticateUser() {
        let userStore = DIContainer.makeUserStore()
        userStore.isUserSignedIn ? startMainApp() : startAuth()
    }
    
    func startAuth() {
        let authCoordinator = AuthCoordinator()
        pushCoordinator(authCoordinator)
        window.rootViewController = authCoordinator.rootViewController
        window.makeKeyAndVisible()
        
        authCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
            self?.autenticateUser()
        }
    }
    
    func startMainApp() {
        let mainAppCoordinator = MainAppCoordinator()
        pushCoordinator(mainAppCoordinator)
        window.rootViewController = mainAppCoordinator.rootViewController
        window.makeKeyAndVisible()
        
        mainAppCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
            self?.startAuth()
        }
    }
}
