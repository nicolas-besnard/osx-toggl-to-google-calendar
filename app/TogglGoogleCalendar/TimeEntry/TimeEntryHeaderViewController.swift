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
    @IBOutlet weak var timerLabel: NSTextField!
    
    var timer: NSTimer!
    
    var currentEntry: Entry!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.title = "Start"
        
        NSNotificationCenter
            .defaultCenter()
            .addObserver(
                self,
                selector: "changeCurrentEntry:",
                name: "changeCurrentEntryNotification",
                object: nil
        )
    }
    
    func timerFired(timer: NSTimer) {
        timerLabel.stringValue = currentEntry.printableDuration()
    }
    
    func changeCurrentEntry(notification: NSNotification) {
        if let entry = notification.object as? Entry {
            currentEntry = entry
        } else {
            currentEntry = nil
        }
        toggleButton()
    }
    
    func toggleButton() {
        if currentEntry != nil && currentEntry.isRunning {
            button.title = "stop"
            entryNameTextField.editable = false
            entryNameTextField.stringValue = currentEntry.description
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerFired:", userInfo: nil, repeats: true)
        } else {
            button.title = "start"
            entryNameTextField.editable = true
            entryNameTextField.stringValue = ""
            timer.invalidate()
            timer = nil
            timerLabel.stringValue = "00:00:00"
        }
    }
    
    @IBAction func clickButton(sender: AnyObject) {
        println("click")
        println("currentEntry")
        if currentEntry != nil {
            Context.shared.userService.stopEntry(currentEntry)
        }
    }
    
    @IBAction func entryNameAction(sender: AnyObject) {
        if entryNameTextField.editable {
            let entryName = entryNameTextField.stringValue
        
            println("Start entry")
            Context.shared.userService.startNewEntry(entryName)
        }
    }
}
