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
    
    @IBOutlet weak var window: NSWindow!
    var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(CGFloat(-1))
    
    var menu = NSMenu()
    
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        Context.shared.setup()
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
        self.window!.orderOut(self)
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func clickConfigurationItem() {
        NSApp.activateIgnoringOtherApps(true)
        self.window.orderFront(self)
    }
    
}


