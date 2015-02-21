//
//  AppDelegate.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 20/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa
import SwiftyJSON
import AFNetworking

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(CGFloat(-1))
    
    var menu = NSMenu()
    
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
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
        
        self.window!.orderOut(self)
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = AFHTTPRequestSerializer()
        manager.requestSerializer.setAuthorizationHeaderFieldWithUsername("", password: "api_token")
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        manager.GET("https://www.toggl.com/api/v8/me", parameters: nil, success: { (operation, responseObject: AnyObject!) -> Void in
//           let json = responseObject as [String: AnyObject]
//            println(json)
            let json = JSON(responseObject)
            println(json)
            println(json["data"]["api_token"].stringValue)
        }) { (operation, error) -> Void in
            println("-- ERROR --")
            println(operation)
            println(error)
        }
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func clickConfigurationItem() {
        NSApp.activateIgnoringOtherApps(true)
        self.window.orderFront(self)
    }
    
}


