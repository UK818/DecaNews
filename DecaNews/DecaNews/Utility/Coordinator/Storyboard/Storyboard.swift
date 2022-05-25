//
//  Storyboard.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 18/02/2022.
//

import Foundation

enum Storyboard: String {
    
    case onboarding
    case auth
    case news
    case bookmarks
    case comments
    case dashboard
    case profile
    case search
    case settings
    case sideMenu
    
    var identifier: String {
        return rawValue.capitalizedFirstCharacter
    }
}
