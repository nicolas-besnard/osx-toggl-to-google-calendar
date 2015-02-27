//
//  TimeEntryCellView.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 27/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class TimeEntryCellView: NSTableCellView {
    @IBOutlet weak var descriptionTextField: NSTextField!
    @IBOutlet weak var button: NSButton!
    
    var entry: Entry!
    
    @IBAction func clickTimeEntryButton(sender: AnyObject) {
        toggleButtonImage()
    }
    
    func setFromEntry(entry: Entry) {
        self.entry = entry
        descriptionTextField.stringValue = entry.description
        
        toggleButtonImage()
    }
    
    func toggleButtonImage() {
        if (entry.isRunning) {
            button.image = NSImage(named: "stop-empty")
        } else {
            button.image = NSImage(named: "go-empty")
        }
        entry.isRunning = !entry.isRunning
    }
}
