//
//  AppController.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 24/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class AppController: NSObject {
    @IBOutlet weak var mainWindow: MainMenu!
    var auth : GTMOAuth2Authentication!
    let clientID = ""
    let clientSecret = ""
    let keychainItem = "OAuth 2 Login"
    
    let calendarService = GTLServiceCalendar()
    override func awakeFromNib() {
        auth = GTMOAuth2WindowController.authForGoogleFromKeychainForName(keychainItem, clientID: clientID, clientSecret: clientSecret)
        
        calendarService.authorizer = auth
        
        if (auth.canAuthorize) {
            println("IS LOGGED")
        } else {
            println("IS NOT LOGGED")
        }
    }
    
    @IBAction func clickOnGoogleAuth(sender: AnyObject) {
        println("Auth")
        google()
    }
    
    @IBAction func clickGetCalendar(sender: AnyObject) {
        let query: GTLQueryCalendar = GTLQueryCalendar.queryForCalendarListList() as GTLQueryCalendar
        calendarService.authorizer = auth
        query.minAccessRole = "owner";
        calendarService.executeQuery(
            query,
            completionHandler: { (ticket: GTLServiceTicket!, calendarList: AnyObject!, error: NSError!) -> Void in
                println("Calendar")
                println(calendarList)
                println(error)
        })
    }
    @IBAction func clickCheckAuth(sender: AnyObject) {
        println("Auth")
        println(auth)
    }
    
    func google() {
        println("google")
        let scope = "https://www.googleapis.com/auth/calendar"
        let controller = GTMOAuth2WindowController(
            scope: scope,
            clientID: clientID,
            clientSecret: clientSecret,
            keychainItemName: keychainItem,
            resourceBundle: nil
        )
        
        controller.signInSheetModalForWindow(mainWindow, completionHandler: { (auth: GTMOAuth2Authentication!, error: NSError!) -> Void in
            self.auth = auth
        })
    }
}
