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
    let userService = UserService()
    
    
    let user = User()
    
    
    func setup() {
    }
}