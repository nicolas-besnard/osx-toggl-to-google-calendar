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
    var start: String!
    var stop: String!
    var id: Int!

    init(json: JSON) {
        let id = json["id"].intValue
        let description = json["description"].stringValue
        let duration = json["duration"].intValue
        let start = json["start"].stringValue
        let stop = json["stop"].stringValue
        
        self.id = id
        self.description = description
        self.duration = duration
        self.start = start
        self.stop = stop
    }
}