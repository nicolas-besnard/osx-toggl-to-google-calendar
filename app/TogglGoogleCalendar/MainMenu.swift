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
    
    @IBOutlet weak var loginButton: NSButton!
    
    @IBOutlet weak var tasksWindow: NSWindow!
    
    @IBAction func clickLogin(sender: AnyObject) {
        let email = emailTextField.stringValue
        let password = passwordTextField.stringValue
        
        loginButton.enabled = false


        Context.shared.userService.loginWithEmail(email, password: password) { () -> Void in
            self.loginButton.enabled = true

            self.tasksWindow.setFrameOrigin(self.frame.origin)
            self.orderOut(self)
            self.tasksWindow.orderFront(self)
        }
    }
    
    @IBAction func click(sender: AnyObject) {
        var vc = RootViewController(nibName: "RootViewController", bundle: nil)
        self.orderOut(self)
        vc!.view.window!.orderFront(self)
    }
}
