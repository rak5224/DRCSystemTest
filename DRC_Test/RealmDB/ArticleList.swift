//
//  ArticleList.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//

import UIKit
import RealmSwift

class ArticleList: Object {
    
    dynamic var name = ""
    dynamic var createdAt = NSDate()
    let tasks = List<ArticleItem>()
    
//    static func storeNewsInDB(dataModel: NewsDataModel) {
//        let realm = try! Realm()
//        //let taskListA = ArticleList()
//        
//        dataModel.articles.forEach { articleItem in
//            let singleArticle = ArticleItem()
//            singleArticle.content = articleItem.content
//            singleArticle.newsTitle = articleItem.title
//            singleArticle.newsDate = articleItem.publishedAt
//            singleArticle.authorName = articleItem.author ?? ""
//            singleArticle.imageUrl = articleItem.urlToImage ?? ""
//            singleArticle.newsUrl = articleItem.url
//
//            try! realm.write {
//                realm.add(singleArticle)
//            }
//
//        }
//      //  realm.add(taskListA)
//    }
//
//    static func getNewsFromDB() {
//        let articles = try! Realm().objects(ArticleList.self)
//        print(articles)
//    }
}


class ArticleItem: Object {
    @objc dynamic var content = ""
    @objc dynamic var newsTitle = ""
    @objc dynamic var newsDate = ""
    @objc dynamic var authorName = ""
    @objc dynamic var imageUrl = ""
    @objc dynamic var newsUrl = ""
}


//class DBManager {
//    private var   database:Realm
//    static let   sharedInstance = DBManager()
//
//    private init() {
//        database = try! Realm()
//    }
//
//    func getDataFromDB() ->   Results<ArticleItem> {
//        let results: Results =   database.objects(Item.self)
//        return results
//    }
//
//    func addData(object: Item)   {
//        try! database.write {
//            database.add(object, update: true)
//            print("Added new object")
//        }
//    }
//
////    func deleteAllFromDatabase()  {
////        try!   database.write {
////            database.deleteAll()
////        }
////    }
////
////    func deleteFromDb(object: Item)   {
////        try!   database.write {
////            database.delete(object)
////        }
////    }
//}
