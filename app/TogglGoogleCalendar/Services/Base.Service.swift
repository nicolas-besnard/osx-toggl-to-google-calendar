//
//  Base.Service.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 21/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation
import AFNetworking

class BaseService {
    let manager = AFHTTPRequestOperationManager()
    
    init() {
        manager.responseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = AFHTTPRequestSerializer()
        
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    func setUserAuthorization(email: String, password: String) {
        manager.requestSerializer.setAuthorizationHeaderFieldWithUsername(email, password: password)
    }
    
    func setAPIToken(apiToken: String) {
        manager.requestSerializer.setAuthorizationHeaderFieldWithUsername(apiToken, password: "api_token")
    }
    
    func setUserAPIToken() {
        setAPIToken(Context.shared.user.token)
    }
}