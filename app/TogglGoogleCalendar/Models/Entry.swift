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
    var duration: Double!
    var start: NSDate!
    var stop: NSDate!
    var at: NSDate!
    var id: Int!
    var isRunning: Bool

    init(json: JSON) {
        let id = json["id"].intValue
        let description = json["description"].stringValue
        let duration = json["duration"].doubleValue
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
}

extension Entry {
    func printableDuration() -> String {
        var duration = self.duration
        if duration < 0 {
            duration = duration * -1
        }
        
        var otherTime = NSDate(timeIntervalSince1970: duration)
        var now = NSDate()
        
        var t = Int(now.timeIntervalSinceDate(otherTime))
        
        var seconds = t % 60;
        var minutes = (t / 60) % 60;
        var hours = t / 3600;
        
        let strHours = hours > 9 ? String(hours) : "0" + String(hours)
        let strMinutes = minutes > 9 ? String(minutes) : "0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds) : "0" + String(seconds)
            
        return "\(strHours):\(strMinutes):\(strSeconds)"
    }
}

extension Entry {
    private func getFormattedDate(date: String) -> NSDate? {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZZ"
        
        return dateFormatter.dateFromString(date)
    }
}