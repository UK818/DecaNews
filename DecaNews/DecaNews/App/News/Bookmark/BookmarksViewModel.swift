//
//  BookmarksViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//
import Foundation
class BookmarksViewModel {
    var articleDirectory: ArticleDirectoryRepository
    var networkRepository: NetworkManagerRepository
    let cellID = "cell"
    var bookmarkArticles: [BookmarkArticle]
    init(articleDirectory: ArticleDirectoryRepository, networkRepository: NetworkManagerRepository) {
        self.articleDirectory = articleDirectory
        self.networkRepository = networkRepository
        bookmarkArticles = articleDirectory.readBookmarks()
    }
    func removeBookmark(bookmark: BookmarkArticle) {
        articleDirectory.deleteBookmark(article: bookmark)
    }
    func calcReadingTime(text: String) -> String {
        return "\((text.count / 100) * 4) mins read"
    }
}
