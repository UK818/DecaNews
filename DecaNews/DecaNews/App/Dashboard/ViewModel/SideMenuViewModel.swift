//
//  MenuTableViewModel.swift
//  DecaNews
//
//  Created by Decagon on 01/03/2022.
//

import Foundation

final class SideMenuViewModel {
    
    let menuItem = MenuOption.allCases
    private let authServiceRepository: AuthServiceRepository
    private let networkManagerRepository: NetworkManagerRepository
    
    init(authServiceRepository: AuthServiceRepository, networkManagerRepository: NetworkManagerRepository) {
        self.authServiceRepository = authServiceRepository
        self.networkManagerRepository = networkManagerRepository
    }
    
    var images: [String] {
        [ "home", "Bookmark", "card", "edit", "logout", "card", "settings"]
    }
    
    var menuItems: [String] {
        ["Home", "Saved News", "Write News", "Membership", "Help", "Settings", "Logout", "Version 1.0"]
    }
    
    func getUserDetails() -> DashboardUser {
        let user = authServiceRepository.userDetails
        return DashboardUser(photoURL: user?.photoURL, displayName: user?.displayName)
    }
}
