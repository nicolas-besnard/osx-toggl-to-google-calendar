//
//  Entry.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 27/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation
import SwiftyJSON

class Entry {
    var description: String!
    var duration: Int!
    var start: NSDate!
    var stop: NSDate!
    var at: NSDate!
    var id: Int!
    var isRunning: Bool

    init(json: JSON) {
        let id = json["id"].intValue
        let description = json["description"].stringValue
        let duration = json["duration"].intValue
        let start = json["start"].stringValue
        let stop = json["stop"].stringValue
        let at = json["at"].stringValue
        
        self.id = id
        self.description = description
        self.duration = duration
        self.isRunning = duration < 0
        self.start = getFormattedDate(start)
        self.stop = getFormattedDate(stop)
        self.at = getFormattedDate(at)
    }
    
    private func getFormattedDate(stringDate: String!) -> NSDate! {
        if stringDate == nil || stringDate.length == 0 {
            return nil
        }
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZ"

        return dateFormatter.dateFromString(stringDate)!
    }
}