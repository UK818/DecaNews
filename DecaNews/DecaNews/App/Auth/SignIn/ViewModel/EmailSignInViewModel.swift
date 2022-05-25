//
//  EmailSignInViewModel.swift
//  DecaNews
//
//  Created by Decagon on 01/03/2022.
//

import Foundation

final class EmailSignInViewModel {
    
    let userStore: UserPersistenceStore
    let authServiceRepository: AuthServiceRepository
    
    init(store: UserPersistenceStore, authServiceRepository: AuthServiceRepository) {
        self.userStore = store
        self.authServiceRepository = authServiceRepository
    }
    
    func signInUser() {
        userStore.signInUser()
    }
    
    func signIn(email: String, password: String, completionHandler: @escaping (Result<Int, Error>) -> Void) {
        authServiceRepository.signIn(email, password, completionHandler: completionHandler)
    }
}
