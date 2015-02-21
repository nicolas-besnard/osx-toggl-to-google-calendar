//
//  User.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 21/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

class User {
    var token : String! {
        get {

            if let token = Defaults["user_apiToken"].string {
                return token
            }
            return nil
        }
        set
        {
            Defaults["user_apiToken"] = newValue
        }
    }
}