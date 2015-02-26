//
//  EntryWindowController.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 26/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class EntryWindowController: NSWindowController {

    // S I N G L E T O N
    class var shared: EntryWindowController {
        struct Static {
            static let instance = EntryWindowController(windowNibName: "EntryWindowController")
        }
        return Static.instance
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
}
