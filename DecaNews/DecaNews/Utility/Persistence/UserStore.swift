//
//  UserStore.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 28/02/2022.
//

import Foundation

protocol UserPersistenceStore {
    var isUserOnboarded: Bool { get }
    func setUserOnboardingStatus()
    
    var isUserSignedIn: Bool { get }
    func signInUser()
    func signOutUser()
}

final class UserStore: UserPersistenceStore {
    
    var isUserOnboarded: Bool {
        UserDefaults.standard.isUserOnboarded
    }
    
    func setUserOnboardingStatus() {
        UserDefaults.standard.isUserOnboarded = true
    }
    
    var isUserSignedIn: Bool {
        UserDefaults.standard.isUserSignedIn
    }
    
    func signInUser() {
        UserDefaults.standard.isUserSignedIn = true
    }
    
    func signOutUser() {
        UserDefaults.standard.isUserSignedIn = false
    }
}
