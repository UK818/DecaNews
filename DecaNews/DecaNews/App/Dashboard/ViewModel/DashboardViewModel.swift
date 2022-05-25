//
//  DashboardViewModel.swift
//  DecaNews
//
//  Created by Decagon on 01/03/2022.
//

import Foundation

class DashboardViewModel {
    
    let networkManager: NetworkManagerRepository
    let articleRepository: ArticleDirectoryRepository
    
    init(networkManager: NetworkManagerRepository, articleRepository: ArticleDirectoryRepository) {
        self.networkManager = networkManager
        self.articleRepository = articleRepository
    }
    
    var bookmarks: [BookmarkArticle] {
        articleRepository.readBookmarks()
    }
    
    func fetchData(url: String) -> [Article] {
        var articles: [Article]?
        networkManager.networkRequest(url: url) { response in
            articles? = response.articles
        } errorCompletion: { error in
            print("THE ERROR IS: ", error)
        }
        return articles ?? []
    }
    
}
