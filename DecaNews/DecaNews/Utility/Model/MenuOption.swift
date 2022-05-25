//
//  MenuOption.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 04/03/2022.
//

import Foundation

enum MenuOption: CaseIterable {
    case home
    case savedNews
    case writeNews
    case membership
    case help
    case settings
    case logout
//    case version
    
    var displayname: String {
        switch self {
        case .home:
            return "Home"
        case .savedNews:
            return "Saved News"
        case .writeNews:
            return "Write News"
        case .membership:
            return "Membership"
        case .help:
            return "Help"
        case .settings:
            return "Settings"
        case .logout:
            return "Logout"
//        case .version:
//            return "Version 1.0"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "home"
        case .savedNews:
            return "Bookmark"
        case .writeNews:
            return "edit"
        case .membership:
            return "card"
        case .help:
            return "FAQ"
        case .settings:
            return "settings"
        case .logout:
            return "logout"
//        case .version:
//            return ""
        }
    }
}
