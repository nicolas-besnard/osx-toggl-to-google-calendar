//
//  JsonProtocol.swift
//  TogglGoogleCalendar
//
//  Created by Nicolas Besnard on 05/03/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JSONConvertible {
    func toJSON() -> JSON
    class func fromJSON(json: JSON) -> Self?
}