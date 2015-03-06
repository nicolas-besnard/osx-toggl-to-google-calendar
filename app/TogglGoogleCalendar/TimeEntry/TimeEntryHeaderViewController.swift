//
//  TimeEntryHeaderViewController.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 03/03/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class TimeEntryHeaderViewController: NSViewController {

    @IBOutlet weak var entryNameTextField: NSTextField!
    @IBOutlet weak var button: NSButtonCell!
    
    var currentEntry = Context.shared.currentEntry
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.title = "Start"
        
    }
    
    @IBAction func getCalendar(sender: AnyObject) {
        Context.shared.googleCalendar.getRemoteCalendars()
    }
    @IBAction func clickButton(sender: AnyObject) {
        println("click")
        println("currentEntry")
        if Context.shared.currentEntry != nil {
            println("stop")
            Context.shared.userService.stopEntry(Context.shared.currentEntry)
        }
    }
    
    @IBAction func entryNameAction(sender: AnyObject) {
        let entryName = entryNameTextField.stringValue
        
        button.title = "stop"
        println("Start entry")
        Context.shared.userService.startNewEntry(entryName)
    }
}
