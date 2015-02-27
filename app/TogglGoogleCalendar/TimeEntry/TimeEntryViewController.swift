//
//  EntryListViewController.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 26/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

class TimeEntryViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet var contentView: NSView!
    @IBOutlet weak var timeEntryTableView: TimeEntryTableView!
    
    var timeEntryCellViewNib: NSNib!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeEntryTableView.registerNib(timeEntryCellViewNib, forIdentifier: "TimeEntryCellView")
        Context.shared.userService.getTimEntry()
    }
    
    override func loadView() {
        super.loadView()
        timeEntryCellViewNib = NSNib(nibNamed: "TimeEntryCellView", bundle: nil)
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell: TimeEntryCellView!
        cell = tableView.makeViewWithIdentifier("TimeEntryCellView", owner: self) as TimeEntryCellView
        return cell
    }
    
    func tableView(tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 100
    }

    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return 5
    }
    
}
