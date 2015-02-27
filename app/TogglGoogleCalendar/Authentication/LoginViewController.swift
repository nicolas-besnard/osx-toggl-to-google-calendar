//
//  LoginViewController.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 26/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController {

    @IBOutlet weak var emailTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    @IBOutlet weak var loginButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
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
            }
        }
    }
}