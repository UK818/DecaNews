//
//  CommentsModel.swift
//  DecaNews
//
//  Created by Decagon on 20/02/2022.
//

import Foundation

struct CommentModel: Codable {
    var id: String?
    var articleId: String
    var imageUrl: String?
    var usersName: String
    var commentText: String
    var dateAndTime: Date
    var liked: Bool?
    var count: Int?
}
