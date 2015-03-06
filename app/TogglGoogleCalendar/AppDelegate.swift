//
//  AppDelegate.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 20/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate, NSUserInterfaceValidations {
    
    var menuItemTagAlways = 0
    var menuItemTagRequireLogin = 1
    
    var mainWindowController: MainWindowController!
    var preferencesWindowController: PreferencesWindowController!
    var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(CGFloat(-1))
    
    var menu = NSMenu()
    
    var menuLogged = NSMenu()
    
    var user = Context.shared.user
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        Context.shared.setup()

        mainWindowController = MainWindowController(windowNibName: "MainWindowController")
        mainWindowController.window?.releasedWhenClosed = false
        
        
        preferencesWindowController = PreferencesWindowController(windowNibName: "PreferencesWindowController")
        
        statusItem.title = "Title"
        
        statusItem.image = NSImage(named: "toggl-icon")
        statusItem.alternateImage = NSImage(named: "toggl-icon")
        statusItem.highlightMode = true
        statusItem.menu = menu

        println("UserToken: \(Context.shared.user.token)")
        
        initMenu()
        showWindow()
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "showWindow",
            name: "loginNotification",
            object: nil
        )
    }
    
    func validateUserInterfaceItem(anItem: NSValidatedUserInterfaceItem) -> Bool
    {
        let tag = anItem.tag()
        
        if tag == menuItemTagRequireLogin {
            return Context.shared.user.isSignedIn()
        } else if tag == menuItemTagAlways {
            return true
        }
        return false
    }
    
    func initMenu() {
        statusItem.menu = menu
        
        var menuItemShow = NSMenuItem()
        menuItemShow.title = "Show"
        menuItemShow.action = "clickShowItem"
        menuItemShow.tag = menuItemTagAlways
    
        var menuItemPreferences = NSMenuItem()
        menuItemPreferences.title = "Preferences"
        menuItemPreferences.action = "onPreferencesMenuItem"
        
        var menuItemLoggedOut = NSMenuItem()
        menuItemLoggedOut.title = "Logout"
        menuItemLoggedOut.action = "onLoggedOutMenuItem"
        menuItemLoggedOut.tag = menuItemTagRequireLogin
        
        var menuItemQuit = NSMenuItem()
        menuItemQuit.title = "Quit"
        menuItemQuit.action = "onQuitMenuItem"
        menuItemQuit.tag = menuItemTagAlways
        
        menu.addItem(menuItemShow)
        menu.addItem(NSMenuItem.separatorItem())
        
        menu.addItem(menuItemPreferences)
        menu.addItem(menuItemLoggedOut)
        menu.addItem(menuItemQuit)
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func clickShowItem() {
        showWindow()
    }
    
    func onPreferencesMenuItem() {
        preferencesWindowController.showWindow(self)
    }
    
    func onLoggedOutMenuItem() {
        user.logout()
        showWindow()
    }
    
    func onQuitMenuItem() {
        NSApplication.sharedApplication().terminate(self)
    }
    
    func showWindow() {
        mainWindowController.showWindow(self)
        if (Context.shared.user.isSignedIn()) {
            NSNotificationCenter.defaultCenter().postNotificationName("showEntryListNotification", object: nil)
        } else {
            NSNotificationCenter.defaultCenter().postNotificationName("showLoginNotification", object: nil)
        }
        NSApp.activateIgnoringOtherApps(true)
    }
}