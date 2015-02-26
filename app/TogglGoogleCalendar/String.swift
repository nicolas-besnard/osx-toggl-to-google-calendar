//
//  String.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 26/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation

extension String {
    
    public var length: Int {
        get {
            return countElements(self)
        }
    }
    
    public func isEmpty() -> Bool {
        return self.length == 0
    }
    
    public func isEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex)!.evaluateWithObject(self)
    }
}