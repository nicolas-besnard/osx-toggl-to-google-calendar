//
//  PreferencesWindowsControllers.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 27/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class PreferencesWindowController: NSWindowController {

    @IBOutlet weak var signInWithGoogleButton: NSButton!
    
    var user = Context.shared.user
    
    override func windowDidLoad() {
        super.windowDidLoad()
        toggleSignInWithGoogleButton()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func clickSignInWithGoogle(sender: AnyObject) {
        if (!user.isSignedInWithGoogle()) {
            let controller = GTMOAuth2WindowController(
                scope: "https://www.googleapis.com/auth/calendar",
                clientID: Context.shared.environment.clientID,
                clientSecret: Context.shared.environment.clientSecret,
                keychainItemName: Context.shared.environment.keychainItem,
                resourceBundle: nil
            )
            
            controller.signInSheetModalForWindow(self.window!, completionHandler: { (auth: GTMOAuth2Authentication!, error: NSError!) -> Void in
                Context.shared.user.auth = auth
                self.toggleSignInWithGoogleButton()
            })
        } else {
            Context.shared.user.logout()
            self.toggleSignInWithGoogleButton()
        }
    }
    
    private func toggleSignInWithGoogleButton() {
        if (user.isSignedInWithGoogle()) {
            signInWithGoogleButton.image = nil
            signInWithGoogleButton.title = "Sign Out"
        } else {
            signInWithGoogleButton.image = NSImage(named: "sign-in-with-google")
            signInWithGoogleButton.title = ""
        }
    }
}
