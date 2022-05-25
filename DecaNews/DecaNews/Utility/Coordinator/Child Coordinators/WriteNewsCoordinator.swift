//
//  WriteNewsCoordinator.swift
//  DecaNews
//
//  Created by JustifiedTech on 2/21/22.

import UIKit

final class WriteNewsCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        loadWriteNewsRoot()
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }

    func navigateToPreview(_ news: PreviewModel) {
        let viewController = UIStoryboard(name: "News", bundle: nil).instantiateViewController(withIdentifier: "PreviewController") as? PreviewController
               guard let viewController = viewController else { return }
        viewController.goBack = {
            self.goBack()
        }
        viewController.news = news
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func loadWriteNewsRoot() {
        let viewController = WriteNewsViewController()
        viewController.navigateToPreview = { [weak self] in
            self?.navigateToPreview(viewController.news ?? PreviewModel(title: "G", content: "hi", topic: "jj"))
        }
        navigationController.pushViewController(viewController, animated: true)
    }

}
