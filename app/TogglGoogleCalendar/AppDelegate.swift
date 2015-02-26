//
//  AppDelegate.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 20/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var mainWindowController: MainWindowController!
    var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(CGFloat(-1))
    
    var menu = NSMenu()
    
    var user = Context.shared.user
    

    @IBOutlet weak var statusMenu: NSMenu!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        Context.shared.setup()

        mainWindowController = MainWindowController(windowNibName: "MainWindowController")
        mainWindowController.window?.releasedWhenClosed = false
        
        statusItem.title = "Title"
        
        statusItem.image = NSImage(named: "toggl-icon")
        statusItem.alternateImage = NSImage(named: "toggl-icon")
        statusItem.highlightMode = true
        statusItem.menu = menu
        
        //Add menuItem to menu
        var menuItem : NSMenuItem = NSMenuItem()
        menuItem.title = "Configuration"
        menuItem.action = Selector("clickConfigurationItem")
        menuItem.keyEquivalent = ""
        
        
        menu.addItem(menuItem)

        println("UserToken: \(Context.shared.user.token)")
        showWindow()
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func clickConfigurationItem() {
        showWindow()
    }
    
    private func showWindow() {
        if (user.isSignedIn()) {
//            window.orderOut(self)
//            entryWindowController.showWindow(self)
        } else {
//            entryWindowController.close()
//            window.orderFront(self)
        }
        NSApp.activateIgnoringOtherApps(true)
    }
}