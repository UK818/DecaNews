//
//  BookmarkModel.swift
//  DecaNews
//
//  Created by mac on 16/02/2022.
//

import Foundation
import RealmSwift

class BookmarkArticle: Object {
	@objc dynamic var articleId = UUID().uuidString
	@objc dynamic var author: String = ""
	@objc dynamic var title: String = ""
	@objc dynamic var articleDescription: String = ""
	@objc dynamic var url: String = ""
	@objc dynamic var urlToImage: String = ""
	@objc dynamic var publishedAt: String = ""
	@objc dynamic var content: String = ""

	override static func primaryKey() -> String? {
		return "articleId"
	}
}
