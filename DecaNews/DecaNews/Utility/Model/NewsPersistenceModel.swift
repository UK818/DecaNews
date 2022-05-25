//
//  NewsPersistenceModel.swift
//  DecaNews
//
//  Created by Geniusjames on 11/02/2022.
//

import Foundation
import UIKit

struct News: Codable {
    let author: String?
    let title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

}
