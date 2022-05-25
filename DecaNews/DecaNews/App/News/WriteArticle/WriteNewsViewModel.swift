//
//  WriteNewsViewModel.swift
//  DecaNews
//
//  Created by JustifiedTech on 2/21/22.
//

import Foundation

class WriteNewsViewModel {
    let firebaseService = FirebaseService()
    
    func saveToFirebase(title: String, topic: String, content: String, cover: String, _ completionHandler: @escaping (Result<String, Error>) -> Void ) {
        firebaseService.saveNewsData(title: title, topic: topic, content: content, cover: cover, completionHandler)
    }
    
    func uploadImage(image: Data, completionHandler: @escaping (Result<String, Error>) -> Void ) {
        firebaseService.uploadImage(image: image, completionHandler)
        
    }
    
}
