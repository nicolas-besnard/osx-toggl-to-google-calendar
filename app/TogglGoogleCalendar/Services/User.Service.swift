//
//  User.Service.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 21/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation
import SwiftyJSON
import AFNetworking


typealias ServiceResponse = (() -> Void)!

class UserService: BaseService {
    var user: User!
    
    init (user: User) {
        super.init()
        self.user = user
    }
    
    func loginWithAPIToken(onComplete: ServiceResponse) {
        setAPIToken(user.token)
        login(onComplete)
    }
    
    func loginWithEmail(email: String, password: String, onComplete: ServiceResponse) {
        setUserAuthorization(email, password: password)
        login(onComplete)
    }
    
    func getTimEntry() {
        setAPIToken(user.token)
        
        manager.GET(
            "https://www.toggl.com/api/v8/time_entries",
            parameters: nil,
            success: { (operation, response) -> Void in
                
                let json = JSON(response)
                
                Context.shared.entries.getFromJSON(json)
                
        }) { (operation, error) -> Void in
            println("-- ERROR --")
            println(operation)
            println(error)
        }
    }
    
    func stopEntry(entry: Entry) {
        setAPIToken(user.token)
        
        manager.PUT(
            "https://www.toggl.com/api/v8/time_entries/\(entry.id)/stop",
            parameters: nil,
            success: { (operation, response) -> Void in
                
                let json = JSON(response)
                println("SUCCESS STOP")
                println(json)
                
//                let start = json["data"]["start"].string!
//                let stop = json["data"]["stop"].string!
//                
//                var date = NSDateFormatter()
//                date.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'"
                let entry = Entry(json: json["data"])
                Context.shared.googleCalendar.addEventFromEntry(entry)

                
//                if let stopNSDate = date.dateFromString(stop) {
//                    println("OK stop")
//                } else {
//                    println("FAIL stop")
//                }
//                
//                if let startNSDate = date.dateFromString(start) {
//                    println("OK start")
//                } else {
//                    println("FAIL start")
//                }
                
            }) { (operation, error) -> Void in
                println("-- ERROR --")
                println(error)
                println(NSString(data: operation.responseData, encoding: NSUTF8StringEncoding))
        }
    }
    func startNewEntry(name: String) {
        let params = [
            "time_entry": [
                "description": name,
                "created_with": "fooBar"
            ]
        ]
        
        setAPIToken(user.token)

        manager.POST(
            "https://www.toggl.com/api/v8/time_entries/start",
            parameters: params,
            success: { (operation, response) -> Void in
                
                let json = JSON(response)
                
                println("OK")
                println(json)
                
                var entry = Entry(json: json["data"])
                Context.shared.currentEntry = entry
                Context.shared.entries.add(entry)
                
            }) { (operation, error) -> Void in
                println("-- ERROR --")
//                println(operation)
                println(error)
                println(NSString(data: operation.responseData, encoding: NSUTF8StringEncoding))
            }
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