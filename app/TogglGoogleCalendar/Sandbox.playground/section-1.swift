// Playground - noun: a place where people can play

import Cocoa

var time = 1425754488

var otherTime = NSDate(timeIntervalSince1970: 1425754488)
var now = NSDate()

var t = Int(now.timeIntervalSinceDate(otherTime))

var seconds = t % 60;
var minutes = (t / 60) % 60;
var hours = t / 3600;
