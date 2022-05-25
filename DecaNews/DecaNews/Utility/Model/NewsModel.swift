//
//  NewsModel.swift
//  DecaNews
//
//  Created by mac on 09/02/2022.
//

import Foundation

struct Base: Codable {
	let status: String?
	let totalResults: Int?
	let articles: [Article]
}

struct Article: Codable {
	let source: Source
	let author: String?
	let title, articleDescription: String?
	let url: String?
	let urlToImage: String?
	let publishedAt: String?
	let content: String?

	enum CodingKeys: String, CodingKey {
		case author, title
		case articleDescription = "description"
		case url, urlToImage, content
		case publishedAt
		case source
	}
	
}

struct Source: Codable {
	let id: String?
	let name: String?
}
