//
//  AppController.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 24/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class AppController: NSObject {

    // Outlet
    @IBOutlet weak var mainWindow: NSWindow!
    @IBOutlet weak var emailTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    @IBOutlet weak var loginButton: NSButton!
    
    let user = Context.shared.user
    
    override func awakeFromNib() {
        println("isSignedIn")
        println(user.isSignedIn())
    }

    @IBAction func clickLoginButton(sender: AnyObject) {
        let email = emailTextField.stringValue
        let password = passwordTextField.stringValue
        
        
        if email.length == 0 || !email.isEmail() {
            emailTextField.becomeFirstResponder()
        }
        else if password.length == 0{
            passwordTextField.becomeFirstResponder()
        } else {
            loginButton.enabled = false
            
            Context.shared.userService.loginWithEmail(email, password: password) { () -> Void in
                self.loginButton.enabled = true
                self.mainWindow.orderOut(self)
            }
        }
    }
    
    func google() {
        println("google")
        let controller = GTMOAuth2WindowController(
            scope: "https://www.googleapis.com/auth/calendar",
            clientID: "aze",
            clientSecret: "aze",
            keychainItemName: "aze",
            resourceBundle: nil
        )
        
        controller.signInSheetModalForWindow(mainWindow, completionHandler: { (auth: GTMOAuth2Authentication!, error: NSError!) -> Void in
            Context.shared.user.auth = auth
        })
    }
}
