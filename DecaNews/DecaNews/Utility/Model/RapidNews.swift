//
//  RapidNews.swift
//  DecaNews
//
//  Created by Decagon on 16/03/2022.
//

import Foundation

struct RapidNews: Codable {
    let author: String?
    let title: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    enum CodingKeys: String, CodingKey {
        case author, title
        case url = "link", urlToImage = "media", content = "summary"
        case publishedAt = "published_date"
    }
}
struct Rapid: Codable {
    let articles: [RapidNews]
}
