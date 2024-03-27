//
//  1_4.swift
//  Multithreading
//


import Foundation

protocol FlyingProtocol {
    func fly()
}

class Bird {
    func layEggs() {

    }
}

class Swift: Bird, FlyingProtocol {
    func fly() {
    }
}

class Penguin: Bird {

}

let myBird: Bird = Penguin()
//myBird.layEggs()  // Приведет к ошибке во время выполнения

