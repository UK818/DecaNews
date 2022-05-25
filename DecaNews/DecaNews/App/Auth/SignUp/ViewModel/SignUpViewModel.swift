//
//  SignUpViewModel.swift
//  DecaNews
//
//  Created by Decagon on 01/03/2022.
//

import Foundation

final class SignUpViewModel {
    
    let userStore: UserPersistenceStore
    let userAuth: AuthServiceRepository
    
    init(store: UserPersistenceStore, auth: AuthServiceRepository ) {
        self.userStore = store
        self.userAuth = auth
    }
    
    func didSignIn() {
        userStore.signInUser()
    }
    
    func signUp(_ email: String, _ password: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void) {
        userAuth.signUp(email, password, completionHandler)
    }
    
}
