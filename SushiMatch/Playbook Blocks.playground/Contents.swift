//: Playground - noun: a place where people can play

import Cocoa

func blocky(block: Void -> Void) {
    block()
}

blocky { () -> Void in
    print("Hello")
}

