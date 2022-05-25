//
//  DashboardComposer.swift
//  DecaNews
//
//  Created by Decagon on 02/03/2022.
//

import Foundation

final class DashboardComposer {
    
    static func makeDashboarReViewController() -> DashboardViewController {
        let viewController = DashboardViewController.instantiate()
        viewController.sideMenuController = makeMenuTableViewController()
        viewController.headerViewModel = DIContainer.makeDashboardCollectionViewModel()
        viewController.viewModel = DIContainer.makeDashboardTableViewModel()
        return viewController
    }
    
    private static func makeMenuTableViewController() -> SideMenuViewController {
        let viewController = SideMenuViewController.instantiate()
        viewController.viewModel = DIContainer.makeMenuTableViewModel()
        return viewController
    }
    
    static func makeLatestViewController() -> LatestNewsViewController {
        let viewController = LatestNewsViewController.instantiate()
        viewController.viewModel = DIContainer.makeLatestNewsViewModel()
        return viewController
    }
}
