//
//  SearchNewsViewModel.swift
//  DecaNews
//
//  Created by Decagon on 16/02/2022.
//

import Foundation

final class SearchNewsViewModel {
    private var newsURL: String
    var articles = [Article]()
    private var currentSortPattern: SearchSortBy = .popular
    var currentSearchString = "News"
    var included = false
    let fromDate: String
    let toDate: String
    
    var populateTable: (() -> Void)?
    
    init() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY-MM-dd"
        toDate = dateFormatter.string(from: date)
        var dayComponent = DateComponents()
        dayComponent.day = -7
        let theCalendar = Calendar.current
        let nextDate = theCalendar.date(byAdding: dayComponent, to: date) ?? Date()
        fromDate = dateFormatter.string(from: nextDate)
        newsURL = ""
    }
    
    var getCurrentSortPattern: SearchSortBy {
        return currentSortPattern
    }
    var getCurrentSearchString: String {
        return currentSearchString
    }
    
    func fetchNews() {
        newsURL =  "https://newsapi.org/v2/everything?q=\(currentSearchString)&from=\(fromDate)&to=\(currentSortPattern == .oldest ? fromDate : toDate)\(currentSortPattern == .popular ? "&sortBy=popularity" : "&sortBy=publishedAt")&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
        NetworkManager().networkRequest(url: newsURL) { [weak self] res in
            self?.articles = self?.currentSortPattern != .oldest ? res.articles : res.articles.reversed()
            self?.populateTable?()
        } errorCompletion: { _ in
        }

    }
    
    func setCurrentSortPattern(_ sortBy: SearchSortBy) {
        currentSortPattern = sortBy
    }
    func setCurrentSearchString(_ searchString: String) {
        currentSearchString = searchString
    }
    
    func sort() {
        fetchNews()
    }
}
