//
//  TasksWindowController.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 22/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class TasksWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        println("Controller")
        self.window!.orderOut(self)
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
