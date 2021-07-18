//
//  NewsListViewModel.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//

import UIKit
import RealmSwift

class NewsListViewModel: NSObject {
    
    var items = [NewsCellViewModel]()
    
    func getNewsData(successBlock: @escaping (_ success: Bool) -> Void) {
        NewsAPIClass.getNewsFeeds { dataModel in
            guard let thisDataModel = dataModel else {
                successBlock(false)
                return
            }
            
            dataModel?.articles.forEach({ [weak self] singleItem in
                self?.items.append(NewsCellViewModel(article: singleItem))
            })
            
            self.storeNewsInDB(dataModel: thisDataModel)
            print(thisDataModel)
            self.getNewsFromDB()
            successBlock(true)
        }
    }
    
    func storeNewsInDB(dataModel: NewsDataModel) {
        deleteAllFromDB()
        
        let realm = try! Realm()
        dataModel.articles.forEach { articleItem in
            let singleArticle = ArticleItem()
            singleArticle.content = articleItem.content
            singleArticle.newsTitle = articleItem.title
            singleArticle.newsDate = articleItem.publishedAt
            singleArticle.authorName = articleItem.author ?? ""
            singleArticle.imageUrl = articleItem.urlToImage ?? ""
            singleArticle.newsUrl = articleItem.url

            try! realm.write {
                realm.add(singleArticle)
            }
        }
    }
    
    func getNewsFromDB() {
        let articles = try! Realm().objects(ArticleItem.self)
        self.items.removeAll()
        if articles.count > 0 {
            articles.forEach { articleItem in
                self.items.append(NewsCellViewModel(article: articleItem))
            }
        }
    }
    
    func deleteAllFromDB()  {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}



