//
//  Environment.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 24/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation

class Environment
{
    enum Type: Int
    {
        case PRODUCTION, DEVELOPMENT
    }
    
    var value: Type = .DEVELOPMENT
    let clientID = ""
    let clientSecret = ""
    let keychainItem = "Toggl to Google Calendar"
    
    init(setEnv env: Type)
    {
        self.value = env
    }
    
    func isProduction() -> Bool
    {
        return self.value == .PRODUCTION
    }
    
    func isDevelopment() -> Bool
    {
        return self.value == .DEVELOPMENT
    }
}