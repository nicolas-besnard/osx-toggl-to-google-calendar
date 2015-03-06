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
    @IBOutlet weak var header: NSView!
    
    var timeEntryCellViewNib: NSNib!
    var entries = Context.shared.entries
    
    var timeEntryHeaderViewController: TimeEntryHeaderViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeEntryTableView.registerNib(timeEntryCellViewNib, forIdentifier: "TimeEntryCellView")
        Context.shared.userService.getTimEntry()
        
        NSNotificationCenter.defaultCenter().addObserver(
            timeEntryTableView,
            selector: "reloadData",
            name: "entriesUpdatedNotification",
            object: nil
        )
    }
    
    override func loadView() {
        super.loadView()
        timeEntryCellViewNib = NSNib(nibNamed: "TimeEntryCellView", bundle: nil)
        
        timeEntryHeaderViewController = TimeEntryHeaderViewController(nibName: "TimeEntryHeaderViewController", bundle: nil)
        header.addSubview(timeEntryHeaderViewController!.view)
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell: TimeEntryCellView!
        cell = tableView.makeViewWithIdentifier("TimeEntryCellView", owner: self) as TimeEntryCellView
        cell.setFromEntry(entries[row])
        
        return cell
    }
    
    func tableView(tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 100
    }

    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return entries.count()
    }
    
}
