//
//  NewsCellVIewModel.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//

import UIKit

class NewsCellViewModel: NSObject {
    
    var content: String
    var newsTitle: String
    var newsDate: String
    var authorName: String
    var imageUrl: String
    var newsUrl: String
    
    init(article: Article) {
        self.content = article.content
        self.newsTitle = "News Title :- " + article.title
        self.newsDate = "Created At :- " + article.publishedAt
        self.authorName = "Author Name :- " + (article.author ?? "")
        self.imageUrl = article.urlToImage ?? ""
        self.newsUrl = article.url
    }
    
    init(article: ArticleItem) {
        self.content = article.content
        self.newsTitle = "News Title :- " + article.newsTitle
        self.newsDate = "Created At :- " + DRCUtility.getFormattedDate(article.newsDate)
        self.authorName = "Author Name :- " + article.authorName
        self.imageUrl = article.imageUrl
        self.newsUrl = article.newsUrl
    }
}
