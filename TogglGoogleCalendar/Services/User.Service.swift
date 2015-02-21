//
//  User.Service.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 21/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserService: BaseService {
    func loginWithAPIToken(apiToken: String) {
        setAPIToken(apiToken)
        login()
    }
    
    func loginWithEmail(email: String, password: String) {
        setUserAuthorization(email, password: password)
        login()
    }
    
    private func login() {
        manager.GET("https://www.toggl.com/api/v8/me", parameters: nil, success: { (operation, responseObject: AnyObject!) -> Void in
            let json = JSON(responseObject)
            let token = json["data"]["api_token"].stringValue
            println("TOKEN ! \(token)")
            Context.shared.user.token = token
        }) { (operation, error) -> Void in
            println("-- ERROR --")
            println(operation)
            println(error)
        }
    }
}