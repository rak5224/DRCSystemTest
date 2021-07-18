//
//  NewsAPIClass.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//

import UIKit
import Alamofire

class NewsAPIClass: NSObject {
    
    class func getNewsFeeds(successBlock: @escaping (NewsDataModel?) -> Void) {
        let request = Alamofire.request("https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=f1fdde20c9d74859804996f62a8e3d16")
        request.responseJSON { responseData in
            print(responseData)
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: responseData.value as Any, options: .prettyPrinted)
                let newsModel = try jsonData.decoded() as NewsDataModel
                successBlock(newsModel)
            } catch {
                print(error)
                successBlock(nil)
            }
        }
    }
    
    class func isConnected() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

extension Data {
    func decoded<T: Decodable>() throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: self)
    }
}



