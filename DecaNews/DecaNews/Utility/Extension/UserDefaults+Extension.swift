//
//  UserDefaults+Extension.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 28/02/2022.
//

import Foundation

extension UserDefaults {
    
    enum UserKeys: String {
        case token
    }
    
    enum DeviceKeys: String {
        case isUserOnboarded
        case isUserSignedIn
    }
    
    var isUserOnboarded: Bool {
        get { object(forKey: DeviceKeys.isUserOnboarded.rawValue) as? Bool ?? false }
        set { set(newValue, forKey: DeviceKeys.isUserOnboarded.rawValue) }
    }
    
    var isUserSignedIn: Bool {
        get { object(forKey: DeviceKeys.isUserSignedIn.rawValue) as? Bool ?? false }
        set { set(newValue, forKey: DeviceKeys.isUserSignedIn.rawValue) }
    }
}
