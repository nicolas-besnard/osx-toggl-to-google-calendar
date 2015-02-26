//
//  MainWindowController.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 26/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    var loginViewController: LoginViewController!
    
    @IBOutlet weak var contentView: NSView!
    
    override func windowWillLoad() {
        if loginViewController == nil {
            loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            loginViewController.view.autoresizingMask = NSAutoresizingMaskOptions.ViewWidthSizable | NSAutoresizingMaskOptions.ViewHeightSizable
            
            NSNotificationCenter.defaultCenter().addObserver(
                self,
                selector: "showLogin:",
                name: "showLoginNotification",
                object: nil)
        }
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
//        showLogin()
        println("did load")
    }
    
    func showLogin(notification: NSNotification) {
        contentView.addSubview(loginViewController.view)
        loginViewController.view.frame = contentView.bounds
    }
}