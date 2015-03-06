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
var date = NSDateFormatter()

//var time = "2015-03-05T23:18:13+00:00"
date.locale = NSLocale(localeIdentifier: "en_US_POSIX")


// W O R K I N G
//var time = "2013-03-05T07:58:58.000Z"
//date.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'"

var time = "2015-03-06T23:18:17Z"
//date.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
date.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZZ"
date.dateFromString(time)

date.description

NSTimeZone(name: "Europe/London")?.abbreviation
