//
//  FirebaseViewModel.swift
//  DecaNews
//
//  Created by Decagon on 24/01/2022.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseStorage

protocol AuthServiceRepository {
    func signUp(_ email: String, _ password: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void)
    func signIn(_ email: String, _ password: String, completionHandler: @escaping (Result<Int, Error>) -> Void)
    func resetPassword(_ text: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void)
    func changePassword(oldPassword: String, newPassword: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void)
    var userDetails: FirebaseAuth.User? { get }
}

final class FirebaseService: AuthServiceRepository {
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    private let storage = Storage.storage().reference()
    
    var userDetails: FirebaseAuth.User? {
        auth.currentUser
    }
    
    func signUp(_ email: String, _ password: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            completionHandler(.success(0))
        }
    }
    
    func signIn(_ email: String, _ password: String, completionHandler: @escaping (Result<Int, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            completionHandler(.success(0))
        }
    }
    
    func resetPassword(_ text: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void) {
        auth.sendPasswordReset(withEmail: text) { error in
            if let error = error {
                completionHandler(.failure(error))
                return
            } else {
                completionHandler(.success(0))
            }
            
        }
    }
    
    func changePassword(oldPassword: String, newPassword: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void) {
        guard let user = auth.currentUser else {return}
        
        guard let email = user.email else {return}
        var credential: AuthCredential
        credential = EmailAuthProvider.credential(withEmail: email, password: oldPassword )
        user.reauthenticate(with: credential) { _, error  in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                user.updatePassword(to: newPassword) { error in
                    if let error = error {
                        completionHandler(.failure(error))
                    } else {
                        completionHandler(.success(0))
                    }
                }
            }
            
        }
        
    }
    
//    func getUserDetails() -> FirebaseAuth.User? {
//        let user = auth.currentUser
//        return user
//    }
    
    func saveNewsData(title: String, topic: String, content: String, cover: String, _ completionHandler: @escaping (Result<String, Error>) -> Void ) {

        var ref: DocumentReference?
        ref = db.collection("news").addDocument(data: [
            "title": title,
            "topic": topic,
            "content": content,
            "urlToCover": cover
            
        ]) { error in
            if let error = error {
                completionHandler(.failure(error))
                return
            } else {
            completionHandler(.success(ref!.documentID))
            }
        }
    }
    
    func uploadImage(image: Data, _ completionHandler: @escaping (Result<String, Error>) -> Void) {
        storage.child("cover_images/covers").putData(image, metadata: nil, completion: { _, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            } else {
                
                self.storage.child("cover_images/covers").downloadURL(completion: { url, error in
                    if let url = url, error == nil {
                        completionHandler(.success(url.absoluteString))
                    }
                    
                })
                
            }
        })
    }
}
