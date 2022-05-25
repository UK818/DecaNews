//
//  DashboardCollectionViewModel.swift
//  DecaNews
//
//  Created by Decagon on 01/03/2022.
//

import Foundation

final class DashboardCollectionViewModel {
    
    let articleRepository: ArticleDirectoryRepository
    let networkManagerRepository: NetworkManagerRepository
    private let url: String
    private let url2 = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
    private let url3 = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
    private var allArticles: [Article]?
    
    let fromDate: String
    let toDate: String
    
    init(articleRepository: ArticleDirectoryRepository, networkManager: NetworkManagerRepository) {
        self.articleRepository = articleRepository
        self.networkManagerRepository = networkManager
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY-MM-dd"
        toDate = dateFormatter.string(from: date)
        var dayComponent = DateComponents()
        dayComponent.day = -7
        let theCalendar = Calendar.current
        let nextDate = theCalendar.date(byAdding: dayComponent, to: date) ?? Date()
        fromDate = dateFormatter.string(from: nextDate)
        
        url = "https://newsapi.org/v2/everything?q=apple&from=\(fromDate)&to=\(toDate)&sortBy=popularity&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
    }
    
    var collectionViewNews: [Article] {
        get {
            return allArticles ?? []
        }
        set {
            allArticles = newValue
        }
    }
    
    func setArticles(articles: [Article]) {
        self.collectionViewNews = articles
    }
    
    func fetchData(_ urlNumber: Int, successCompletion: @escaping () -> Void, errorCompletion: ErrorBlock) {
        let selectedURL: String
        if urlNumber == 1 {
            selectedURL = url
        } else if urlNumber == 2 {
            selectedURL = url2
        } else {
            selectedURL = url3
        }
        networkManagerRepository.networkRequest(url: selectedURL, successCompletion: { [weak self] response in
            self?.setArticles(articles: response.articles)
            successCompletion()
        }, errorCompletion: errorCompletion)
    }

    func addBookMark(article: Article) {
        let bookmark = BookmarkComposer.makeBookmarkFromArticle(article)
        articleRepository.addBookmark(bookmark)
    }
    
    func deleteBookMark(url: String?) {
        guard let url = url, let bookMark = articleRepository.readBookmark(url: url) else { return }
        articleRepository.deleteBookmark(article: bookMark)
    }
}
