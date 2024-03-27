//
//  1_2.swift
//  Multithreading
//Принцип открытости-закрытости


import Foundation

class Animal {
    let name: String

    init(name: String) {
        self.name = name
    }

    func makeSound() {
        print("\(name) издает звук - ")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("\(name) издает звук - Арррр")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("\(name) издает звук - Миу")
    }
}
