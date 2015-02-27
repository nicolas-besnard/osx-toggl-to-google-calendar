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
    
    func setFromEntry(entry: Entry) {
        descriptionTextField.stringValue = entry.description
    }
}
