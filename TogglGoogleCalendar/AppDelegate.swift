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

        manager.GET("https://www.toggl.com/api/v8/me", parameters: nil, success: { (operation, responseObject) -> Void in
            println(operation)
            println(responseObject)
        }) { (operation, error) -> Void in
            println("-- ERROR --")
            println(operation)
            println(error)
        }
        
//        [manager GET:@"http://example.com/resources.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"JSON: %@", responseObject);
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//        }];
        
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        
//        NSURLCredential *credential = [NSURLCredential credentialWithUser:@"user" password:@"passwd" persistence:NSURLCredentialPersistenceNone];
//        
//        NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"GET" URLString:@"https://httpbin.org/basic-auth/user/passwd" parameters:nil];
//        
//        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//        [operation setCredential:credential];
//        [operation setResponseSerializer:[AFJSONResponseSerializer alloc]];
//        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"Success: %@", responseObject);
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Failure: %@", error);
//        }];
//        [manager.operationQueue addOperation:operation];

    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func clickConfigurationItem() {
        NSApp.activateIgnoringOtherApps(true)
        self.window.orderFront(self)
    }
    
}


