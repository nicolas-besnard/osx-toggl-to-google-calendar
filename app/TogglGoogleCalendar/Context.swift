//
//  Context.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 21/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation

class Context {
    // S I N G L E T O N
    class var shared : Context {
        struct Static {
            static let instance : Context = Context()
        }
        return Static.instance
    }
    
    // Service
    let entries = Entries()
    var currentEntry: Entry! = nil {
        didSet {
            NSNotificationCenter
                .defaultCenter()
                .postNotificationName("changeCurrentEntryNotification", object: self.currentEntry)
        }
    }
    
    let environment = Environment(setEnv: .DEVELOPMENT)
    var user: User!
    var userService: UserService!
    var googleCalendar: GoogleCalendar!
    
    
    func setup() {
        user = User()
        userService = UserService(user: user)
        googleCalendar = GoogleCalendar()
    }
}