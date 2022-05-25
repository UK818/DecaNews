//
//  BookmarksCoordinator.swift
//  DecaNews
//
//  Created by Geniusjames on 15/02/2022.
//

import UIKit

final class BookmarksCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        loadBookmarks()
    }

    func loadBookmarks() {
        let viewController = BookmarksViewController.instantiate()
        viewController.viewModel = DIContainer.makeBookmarkViewModel()
        viewController.didSelectArticle = {[weak self] selectedArticle in
            self?.showNewsDetail(article: selectedArticle)
            
        }
        viewController.didCompleteBookmark = { [weak self] in
            self?.finish()
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    func showNewsDetail(article: Article) {
        let newsDetailsController = NewsDetailsViewController.instantiate()
        newsDetailsController.article = article
        navigationController.pushViewController(newsDetailsController, animated: true)
    }
}
