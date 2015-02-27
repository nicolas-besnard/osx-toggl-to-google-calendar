//
//  User.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 21/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftyUserDefaults

class User {
    var token: String! {
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
    
    var auth: GTMOAuth2Authentication!
    let calendarService = GTLServiceCalendar()
    
    var id: Int! {
        get {
            if let id = Defaults["user_id"].int {
                return id
            }
            return nil
        }
        set {
            Defaults["user_id"] = newValue
        }
    }
    
    var email: String! {
        get {
            if let email = Defaults["user_email"].string {
                return email
            }
            return nil
        }
        set {
            Defaults["user_email"] = newValue
        }
    }
    
    var timezone: String! {
        get {
            if let timezone = Defaults["user_timezone"].string {
                return timezone
            }
            return nil
        }
        set {
            Defaults["user_timezone"] = newValue
        }
    }

    init() {}
    
    func isSignedIn() -> Bool {
        return token != nil
    }
    
    func getNSTimezone() -> NSTimeZone {
        return NSTimeZone(name: timezone)!
    }
    
    func isSignedInWithGoogle() -> Bool {
        getTokenFromKeychain()
        return auth.canAuthorize
    }
    
    func getCalendarService() -> GTLServiceCalendar {
        calendarService.authorizer = auth
        
        return calendarService
    }
    
    func logout() {
        token = nil
    }
    
    func setDataFromLogin(json: JSON) {
        let jsonData = json["data"]
        let token = jsonData["api_token"].stringValue
        let id = jsonData["id"].intValue
        let email = jsonData["email"].stringValue
        let timezone = jsonData["timezone"].stringValue
    
        self.token = token
        self.id = id
        self.email = email
        self.timezone = timezone
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