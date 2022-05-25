//
//  ArticleDirectory.swift
//  DecaNews
//
//  Created by mac on 09/02/2022.
//

import Foundation
import RealmSwift

protocol ArticleDirectoryRepository {
    func readBookmarks() -> [BookmarkArticle]
    func readBookmark(url: String) -> BookmarkArticle?
//    func addBookmark(author: String, title: String, articleDescription: String, url: String, urlToImage: String, publishedAt: String, content: String)
    func addBookmark(_ article: BookmarkArticle)
    func deleteBookmark(article: BookmarkArticle)
//    func updateBookmark(article: BookmarkArticle, author: String, title: String, articleDescription: String, url: String, urlToImage: String, publishedAt: String, content: String)
}

class ArticleDirectory: ArticleDirectoryRepository {
	// swiftlint:disable force_try
	private let realm = try! Realm()

	func readBookmarks() -> [BookmarkArticle] {
		var data = [BookmarkArticle]()
		data = realm.objects(BookmarkArticle.self).map({ $0 })
        print(data, "testing bookmarks")
        print("User Realm User file location: \(realm.configuration.fileURL!.path)")
		return data
	}

    func readBookmark(url: String) -> BookmarkArticle? {
        realm.objects(BookmarkArticle.self).filter { bookArticle in
            bookArticle.url == url
        }.first
    }

    func addBookmark(_ article: BookmarkArticle) {
		try? realm.write {
			realm.add(article)
		}
	}

	func deleteBookmark(article: BookmarkArticle) {
		try? realm.write {
			realm.delete(article)
		}
	}

//	func updateBookmark(
//		article: BookmarkArticle,
//		author: String,
//		title: String,
//		articleDescription: String,
//		url: String,
//		urlToImage: String,
//		publishedAt: String,
//		content: String
//	) {
//		try? realm!.write {
//			article.author = author
//			article.title = title
//			article.articleDescription = articleDescription
//			article.url = url
//			article.urlToImage = urlToImage
//			article.publishedAt = publishedAt
//			article.content = content
//			realm!.add(article, update: .all)
//		}
//	}
	
}
