//
//  MainWindow.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 25/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class MainWindow: NSWindow {

    override func awakeFromNib() {
        
    }
    func google() {
        println("google")
        let scope = "https://www.googleapis.com/auth/calendar"
        let controller = GTMOAuth2WindowController(
            scope: scope,
            clientID: Context.shared.environment.clientID,
            clientSecret: Context.shared.environment.clientSecret,
            keychainItemName: Context.shared.environment.keychainItem,
            resourceBundle: nil
        )
        
        controller.signInSheetModalForWindow(self, completionHandler: { (auth: GTMOAuth2Authentication!, error: NSError!) -> Void in
//            Context.shared.user.auth = auth
        })
    }
}
