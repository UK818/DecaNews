//
//  MainAppCoordinator.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 14/02/2022.
//

import UIKit

final class MainAppCoordinator: Coordinator {
    
    private let navigationController: BaseNavigationController
    private let userStore: UserPersistenceStore
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    override init() {
        navigationController = BaseNavigationController()
        userStore = DIContainer.makeUserStore()
        super.init()
        navigationController.delegate = self
    }
    
    override func start() {
        loadMainAppRoot()
    }
    
    override func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navigationController.setBlackButton()
    }
    
    func loadMainAppRoot() {
        let viewController = DashboardComposer.makeDashboarReViewController()
        viewController.didSelectArticle = { [weak self] selectedArticle in
            self?.showNewsDetail(article: selectedArticle)
        }
        
        viewController.sideMenuController.didSelectShowProfile = { [weak self] in
            self?.showProfile()
        }
        
        viewController.sideMenuController.didSelectMenuOption = {
            switch $0 {
            case .home:
                break
            case .writeNews:
                self.showWriteNews()
            case .savedNews:
                self.showBookMarks()
            case .membership:
                self.showComingSoon()
            case .help:
                self.showComingSoon()
            case .settings:
                self.showSettings()
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
            self?.userStore.signOutUser()
        }))
        navigationController.present(alert, animated: true, completion: nil)
    }
    
    func showNewsDetail(article: Article) {
        let newsDetailsController = NewsDetailsViewController.instantiate()
        newsDetailsController.article = article
        navigationController.pushViewController(newsDetailsController, animated: true)
    }
    
    func showWriteNews() {
        let writeNewsCoordinator = WriteNewsCoordinator(navigationController: navigationController)
        pushCoordinator(writeNewsCoordinator)
    }
    
    func showBookMarks() {
        let bookmarksCoordinator = BookmarksCoordinator(navigationController: navigationController)
        pushCoordinator(bookmarksCoordinator)
    }
    
    func showProfile() {
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
        pushCoordinator(profileCoordinator)
    }
    
    func showComingSoon() {
        let soonCoordinator = SoonCoordinator(navigationController: navigationController)
        pushCoordinator(soonCoordinator)
    }
    
    func showSettings() {
        let settingsCoordinator = SettingsCoordinator(navigationController: navigationController)
        pushCoordinator(settingsCoordinator) { [weak self] in
            self?.finish()
        }
    }
}
