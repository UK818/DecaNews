//
//  CommentViewModel.swift
//  DecaNews
//
//  Created by Decagon on 11/02/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class CommentViewModel {

    var persistence = FireStorePersistence(collectionName: "comments")
    let networkManager = NetworkManager()
    let firebaseService = FirebaseService()
    let db = Firestore.firestore()
    init() {
    }
    
    func add(comment: CommentModel) {
        persistence.add(item: comment)
    }
    
//    func readComments(completion: @escaping ([CommentModel]) -> Void) {
//        let comments: [CommentModel] = persistence.read { result in
//            completion(result)
//        }
//    }
    func userName() -> String {
        let user = firebaseService.userDetails
       return user?.displayName ?? "Unknown User"
    }
    var artileId: String {
        get {
            " " // TO-DO: return news article URL
        }
        set {
            _ = newValue
        }
    }
    func getPhotoURL() -> URL {
        let user = firebaseService.userDetails
        guard let url = user?.photoURL else {return URL(fileURLWithPath: "")}
        return  url 
    }
    func addComments(comments: CommentModel) {
        do {// TO-DO: make the second document id the username
            try  db.collection("comments").document("articles").collection("articleID").document().setData(from: comments)
        } catch {
            print("Error saving data")
        }
    }
    func increaseOrDecreaseLike(id: String, val: Int) {
        db.collection("comments").document("articles").collection("articleID").document(id).updateData(["count": FieldValue.increment(Int64(val))])
    }
    func readComments(completion: @escaping (([CommentModel]) -> Void)) {
        var output: [CommentModel] = []
        do {
            db.collection("comments").document("articles").collection("articleID").getDocuments {(querySnapshot, error) in
                if let error = error {
                    print(error)
                } else {
                    for documents in querySnapshot!.documents {
                        let result = Result {
                            try? documents.data(as: CommentModel.self)
                        }
                        switch result {
                        case .success(let doc):
                            if var doc = doc {
                                doc.id = documents.documentID
                                output.append(doc)
                            } else {
                                print("documents does not exits")
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                    completion(output)
                }
            }
        }
    }

}
