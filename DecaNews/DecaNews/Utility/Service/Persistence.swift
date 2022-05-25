//
//  Persistence.swift
//  DecaNews
//
//  Created by Geniusjames on 10/02/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
class FireStorePersistence: PersistenceManager {
    func update() {
        
    }
    
    var collectionName: String
    var id: String?
    let db = Firestore.firestore()

    init(collectionName: String) {
        self.collectionName = collectionName
    }
    func add<T: Codable>(item: T) {
        do {
            try db.collection(collectionName).document().setData(from: item)
        } catch {
            print("error")
        }
    }
    func delete(documentID: String) {
        db.collection(collectionName).document(documentID).delete { err in
            if let err = err {
                print("Error deleting document: \(err)")
            } else {
                print("Document deleted")
            }
        }
    }
    
    func updateProfile (document: [String: Any] ) {
        db.collection(collectionName).parent?.updateData(document)
    }
    
    func search() {
        
    }

    func read<T: Codable>( completion: @escaping (([T]) -> Void)) -> [T] {
        var output: [T] = []
        do {
            db.collection(collectionName).getDocuments { (querySnapshot, error) in
                  
                  if let error = error {
                      print(error)
                  } else {
                      for documents in querySnapshot!.documents {
                          let result = Result {
                              try? documents.data(as: T.self)
                          }
                          switch result {
                          case .success(let doc):
                              if let doc = doc {
                                  output.append(doc)
                              } else {
                                  print("document does not exists")
                              }
                          case .failure(let error):
                              print(error)
                          }
                   }
                      completion(output)
                }
            }
        }
    
        return output
    }
   
    private func enableOffline() {
           let settings = FirestoreSettings()
           settings.isPersistenceEnabled = true
           db.settings = settings
       }
}

protocol PersistenceManager {
    func add<T: Codable>(item: T)
    func delete(documentID: String)
    func update()
    func search()
//    func read<T: Codable>() -> [T]
}
