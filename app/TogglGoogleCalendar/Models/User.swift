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
        set {
            Defaults["user_apiToken"] = newValue
        }
    }
    
    var auth : GTMOAuth2Authentication!
    let calendarService = GTLServiceCalendar()

    init() {}
    
    func isSignedIn() -> Bool {
        return token != nil
    }
    
    func isSignedInWithGoogle() -> Bool {
        if auth == nil {
            getTokenFromKeychain()
        }
        
        return auth.canAuthorize
    }
    
    func getCalendarService() -> GTLServiceCalendar {
        calendarService.authorizer = auth
        
        return calendarService
    }
    
    private func getTokenFromKeychain() {
        if auth == nil {
            let keychainItem = Context.shared.environment.keychainItem
            let clientID = Context.shared.environment.clientID
            let clientSecret = Context.shared.environment.clientSecret
        
            auth = GTMOAuth2WindowController.authForGoogleFromKeychainForName(
                keychainItem,
                clientID: clientID,
                clientSecret: clientSecret
            )
        }
    }
}