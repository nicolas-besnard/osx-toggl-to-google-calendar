// Playground - noun: a place where people can play

import Cocoa

var time = "2013-03-05T07:58:58.000Z"

var date = NSDateFormatter()
//date.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZ"
//date.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
date.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'"
date.dateFromString(time)

date.description

NSTimeZone(name: "Europe/London")?.abbreviation
