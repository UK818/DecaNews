//
//  DashboardTableViewModel.swift
//  DecaNews
//
//  Created by Decagon on 02/03/2022.
//

import Foundation

final class DashboardTableViewModel {
    let articleRepository: ArticleDirectoryRepository
    let networkManagerRepository: NetworkManagerRepository
    private var allArticles: [Article]?
    private let url = "https://free-news.p.rapidapi.com/v1/search?q=News&lang=en"
    let headers = [
        "x-rapidapi-host": "free-news.p.rapidapi.com",
        "x-rapidapi-key": "749708b31cmsha6792b2cb15c6ccp1209cajsn4c4a1c70ce24"
    ]
    init(articleRepository: ArticleDirectoryRepository, networkManagerRepository: NetworkManagerRepository) {
        self.articleRepository = articleRepository
        self.networkManagerRepository = networkManagerRepository
    }
    var articles: [Article] {
        get {
            return allArticles ?? []
        }
        set {
            allArticles = newValue
        }
    }
    func setArticles(articles: [Article]) {
        self.articles = articles
    }
    func fetchData(successCompletion: @escaping () -> Void, errorCompletion: ErrorBlock) {
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        networkManagerRepository.getRapidNews(request: request, successCompletion: { [weak self] response in
            let articleResponse = response.articles
            var newArticles = [Article]()
            for a in articleResponse {
                let newArticle = Article(source: Source(id: nil, name: nil), author: a.author, title: a.title, articleDescription: "", url: a.url, urlToImage: a.urlToImage, publishedAt: a.publishedAt, content: a.content)
                newArticles.append(newArticle)
            }
            self?.setArticles(articles: newArticles)
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
    func getArticle(url: String?) -> BookmarkArticle? {
        return articleRepository.readBookmark(url: url ?? "")
    }
}
