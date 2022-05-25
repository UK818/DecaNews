//
//  SettingsCoordinator.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//

import UIKit

final class SettingsCoordinator: Coordinator {

    private let navigationController: UINavigationController

    var rootViewController: UIViewController {
        navigationController
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        loadSettingsViewController()
    }

    func loadSettingsViewController() {
        guard let viewController = UIStoryboard(name: "Settings", bundle: nil)
                .instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {
                    return
                }
        viewController.didSelectSettingsOption = {
            switch $0 {
            case .membership:
                self.showComingSoon()
            case .notification:
                self.showComingSoon()
            case .language:
                self.showLanguge()
            case .changePassword:
                self.changePassword()
            case .darkMode:
                self.showDarkMode()
            case .community:
                self.showComingSoon()
            case .faqAndHelp:
                self.showComingSoon()
            case .about:
                self.showComingSoon()
            case .logout:
                self.logout()
            }
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func logout() {
        let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { [weak self] _ in
            self?.finish()
            
        }))
        navigationController.present(alert, animated: true, completion: nil)
    }
    
    func showComingSoon() {
        let soonCoordinator = SoonCoordinator(navigationController: navigationController)
        pushCoordinator(soonCoordinator)
    }
    
    func showDarkMode() {
        let window = UIApplication.shared.windows[0]
            var mode = window.overrideUserInterfaceStyle
            mode = mode == .dark ? .light : .dark
    }
    
    func showLanguge() {
        let LanguageChangeCoordinator = LanguageChangeCoordinator(navigationController: navigationController)
        pushCoordinator(LanguageChangeCoordinator)
    }
    
    func changePassword() {
        let PasswordChangeCoordinator = PasswordChangeCoordinator(navigationController: navigationController)
        pushCoordinator(PasswordChangeCoordinator)
    }
 }
