//
//  NewsDataModel.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//

import UIKit
import RealmSwift

struct NewsDataModel: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let content: String
    let title: String
    let author: String?
    let publishedAt: String
    let url: String
    let urlToImage: String?
}
