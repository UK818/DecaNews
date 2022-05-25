//
//  SettingOptions.swift
//  DecaNews
//
//  Created by Decagon on 09/03/2022.
//

import Foundation

enum SettingOptions: CaseIterable {
    case membership
    case notification
    case language
    case changePassword
    case darkMode
    case community
    case faqAndHelp
    case about
    case logout
    
    var displayname: String {
        switch self {
        case .membership:
            return "Membership"
        case .notification:
            return "Notification"
        case .language:
            return "Language"
        case .changePassword:
            return "Change Password"
        case .darkMode:
            return "Dark Mode"
        case .community:
            return "Community"
        case .faqAndHelp:
            return "FAQ & Help"
        case .about:
            return "About"
        case .logout:
            return "Logout"
        
        }
    }
    
    var selection: String {
        switch self {
        case .membership:
            return "Free Plan"
        case .notification:
            return ""
        case .language:
            return "English"
        case .changePassword:
            return ""
        case .darkMode:
            return ""
        case .community:
            return ""
        case .faqAndHelp:
            return ""
        case .about:
            return ""
        case .logout:
            return ""
        }
    }
}
    
