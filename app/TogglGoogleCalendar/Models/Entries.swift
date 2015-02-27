//
//  Entries.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 27/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation
import SwiftyJSON

class Entries {
    private var data: [Entry] = []
    private var countData = 0
    
    init() {}
    
    func add(entry: Entry) {
        data.append(entry)
        ++countData
    }
    
    func count() -> Int {
        return countData
    }
    
    func getFromJSON(json: JSON) {
        for (index, entry) in json {
            var newEntry = Entry(json: entry)
            add(newEntry)
        }
        NSNotificationCenter.defaultCenter().postNotificationName("entriesUpdatedNotification", object: nil)
    }
}