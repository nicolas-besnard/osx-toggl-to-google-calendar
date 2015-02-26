//
//  GoogleCalendar.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 24/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation

class GoogleCalendar {
    var calendars: [GTLCalendarCalendarListEntry] = []
    
    init() {}
    
    func setCalendars(calendars: GTLCalendarCalendarList) {
        for (var i = 0; i < calendars.items().count; ++i) {
            var calendar = calendars[i] as GTLCalendarCalendarListEntry
            self.calendars.append(calendar)
        }
    }
    
    func addEvent() {
        let event = GTLCalendarEvent()
        event.summary = "Summary"
        event.descriptionProperty = "Description"
        
        let date = NSDateComponents()
        date.day = 24
        date.month = 2
        date.year = 2015
        date.hour = 22
        date.minute = 40
        let startDateTime = GTLDateTime(dateComponents: date)
        
        let date2 = NSDateComponents()
        date2.day = 24
        date2.month = 2
        date2.year = 2015
        date2.hour = 23
        date2.minute = 00
        let endDateTime = GTLDateTime(dateComponents: date2)
        
        event.start = GTLCalendarEventDateTime()
        event.start.dateTime = startDateTime
        
        event.end = GTLCalendarEventDateTime()
        event.end.dateTime = endDateTime
        
        let service: GTLServiceCalendar = Context.shared.user.calendarService
        let calendar = withName("Entrepreneur")!
        
        let calendarID = calendar.identifier
        
        let query = GTLQueryCalendar.queryForEventsInsertWithObject(event, calendarId: calendarID) as GTLQueryCalendar

        service.executeQuery(query, completionHandler: { (ticket: GTLServiceTicket!, object: AnyObject!, error: NSError!) -> Void in
            if error == nil {
                println("Event: OK")
            } else {
                println("Event: FAIL")
            }
        })
    }
    
    func getRemoteCalendars() {
        let query: GTLQueryCalendar = GTLQueryCalendar.queryForCalendarListList() as GTLQueryCalendar
        query.minAccessRole = "owner";
        Context.shared.user.calendarService.executeQuery(
            query,
            completionHandler: { (ticket: GTLServiceTicket!, calendarList: AnyObject!, error: NSError!) -> Void in
                if error == nil {
                    println("Successfully get calendar")
                    self.setCalendars(calendarList as GTLCalendarCalendarList)
                } else {
                    println(error)
                }
                
        })
    }
    
    func withName(name: String) -> GTLCalendarCalendarListEntry? {
        return self.calendars.find({ (calendar: GTLCalendarCalendarListEntry) -> Bool in
            calendar.summary == name
        })
    }
    
    func withNameExists(name: String) -> Bool {
        return self.calendars.any({ (calendar: GTLCalendarCalendarListEntry) -> Bool in
            calendar.summary == name
        })
    }
}