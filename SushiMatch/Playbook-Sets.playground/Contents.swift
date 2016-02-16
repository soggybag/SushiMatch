//: Playground - noun: a place where people can play

import Foundation

var array = ["A", "B", "C"]

array.contains("A")

class Dog: Equatable {
    var age = 1
}

func ==(lhs: Dog, rhs: Dog) -> Bool {
    return lhs.age == rhs.age
}



var dogs = [Dog(), Dog(), Dog()]
var sparky = Dog()
dogs.contains(sparky)







