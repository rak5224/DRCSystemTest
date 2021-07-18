//
//  DRCUtility.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//

import UIKit

class DRCUtility: NSObject {
    class func getFormattedDate(_ dateString: String) -> String {
        let isoDate = dateString

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:isoDate)!
        
        dateFormatter.dateFormat = "d MMM, yyyy h:mm a"
        let myStringafd = dateFormatter.string(from: date)
        return myStringafd
    }
}
