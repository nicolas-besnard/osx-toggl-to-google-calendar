// Playground - noun: a place where people can play

import Cocoa

extension String {
    
    public var length: Int {
        get {
            return countElements(self)
        }
    }
    public func removeCharsFromEnd(count:Int) -> String{
        let stringLength = countElements(self)
        
        let substringIndex = (stringLength < count) ? 0 : stringLength - count
        
        return self.substringToIndex(advance(self.startIndex, substringIndex))
    }
    
    public func isEmpty() -> Bool {
        return self.length == 0
    }
    
    public func isEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex)!.evaluateWithObject(self)
    }
}

var time = "2015-02-27T20:19:37+00:00"


//var time = "2013-03-05T07:58:58.000Z"

var date = NSDateFormatter()
//date.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'"
time
date.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZ"
date.dateFromString(time)
date.description

NSTimeZone(name: "Europe/London")?.abbreviation
