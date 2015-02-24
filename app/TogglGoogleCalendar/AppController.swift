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
    
    @IBAction func clickOnGoogleAuth(sender: AnyObject) {
        println("Auth")
        google()
    }
    
    func google() {
        println("google")
        let scope = "https://www.googleapis.com/auth/plus.me"
        let clientID = ""
        let clientSecret = "-"
        let keychainItem = "OAuth 2 Login"
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
