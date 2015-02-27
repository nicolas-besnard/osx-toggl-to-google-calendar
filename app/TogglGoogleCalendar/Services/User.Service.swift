//
//  User.Service.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 21/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias ServiceResponse = (() -> Void)!

class UserService: BaseService {
    func loginWithAPIToken(apiToken: String, onComplete: ServiceResponse) {
        setAPIToken(apiToken)
        login(onComplete)
    }
    
    func loginWithEmail(email: String, password: String, onComplete: ServiceResponse) {
        setUserAuthorization(email, password: password)
        login(onComplete)
    }
    
    private func login(onComplete: ServiceResponse) {
        manager.GET("https://www.toggl.com/api/v8/me", parameters: nil, success: { (operation, responseObject: AnyObject!) -> Void in
            let json = JSON(responseObject)

            Context.shared.user.setDataFromLogin(json)
                        
            if ((onComplete) != nil) {
                println("CALLBACK")
                onComplete()
            }
        }) { (operation, error) -> Void in
            println("-- ERROR --")
            println(operation)
            println(error)
        }
    }
}