//
//  MainMenu.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 21/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class MainMenu: NSWindow {
    @IBOutlet weak var emailTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    
    @IBOutlet weak var tokenLabel: NSTextField!
    
    
    @IBAction func clickLogin(sender: AnyObject) {
        let email = emailTextField.stringValue
        let password = passwordTextField.stringValue
        
        println("Click")
        Context.shared.userService.loginWithEmail(email, password: password)
    }
}
