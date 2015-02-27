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
    var timeEntryViewController: TimeEntryViewController!
    
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
            
            timeEntryViewController = TimeEntryViewController(nibName: "TimeEntryViewController", bundle: nil)
            timeEntryViewController.view.autoresizingMask = NSAutoresizingMaskOptions.ViewWidthSizable | NSAutoresizingMaskOptions.ViewHeightSizable
            
            NSNotificationCenter.defaultCenter().addObserver(
                self,
                selector: "showEntryList:",
                name: "showEntryListNotification",
                object: nil)
        }
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    func showLogin(notification: NSNotification) {
        contentView.addSubview(loginViewController.view)
        loginViewController.view.frame = contentView.bounds
        
        timeEntryViewController.view.removeFromSuperview()
    }
    
    func showEntryList(notification: NSNotification) {
        contentView.addSubview(timeEntryViewController.view)
        timeEntryViewController.view.frame = contentView.bounds
        
        loginViewController.view.removeFromSuperview()
    }
}