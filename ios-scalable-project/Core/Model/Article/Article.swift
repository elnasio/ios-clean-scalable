//
//  Article.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//

import Foundation

struct ArticleResponse: Decodable {
    let count: Int
    let results: [Article]
}

struct Article: Decodable {
    let id: Int
    let title: String
    let url: String
    let publishedAt: String
}
