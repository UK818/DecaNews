//
//  BookmarkComposer.swift
//  DecaNews
//
//  Created by Geniusjames on 08/03/2022.
//

import Foundation

final class BookmarkComposer {
    
    static func makeBookmarkFromArticle(_ article: Article) -> BookmarkArticle {
            let bookmark = BookmarkArticle()
            bookmark.author = article.author ?? ""
            bookmark.title = article.title ?? ""
            bookmark.urlToImage = article.urlToImage ?? ""
            bookmark.url = article.url ?? ""
            bookmark.publishedAt = article.publishedAt ?? ""
            bookmark.content = article.content ?? ""
            bookmark.articleDescription = article.articleDescription ?? ""
        return bookmark
    }
    
    static func makeArticleFromBookmark(_ bookmark: BookmarkArticle) -> Article {
        let source = Source(id: "", name: "")
        let article = Article(source: source, author: bookmark.author, title: bookmark.title, articleDescription: bookmark.articleDescription, url: bookmark.url, urlToImage: bookmark.urlToImage, publishedAt: bookmark.publishedAt, content: bookmark.content)
        return article
    }
}
