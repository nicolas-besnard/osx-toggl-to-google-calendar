//
//  Array.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 24/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation

internal extension Array {
    func find(callback: (T) -> Bool) -> T? {
        for (index, elem: T) in enumerate(self) {
            if callback(elem) {
                return elem
            }
        }
        return nil
    }
    
    func any(callback: (T) -> Bool) -> Bool {
        for (index, elem: T) in enumerate(self) {
            if callback(elem) {
                return true
            }
        }
        return false
    }
}

