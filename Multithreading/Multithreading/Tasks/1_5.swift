//
//  1_5.swift
//  Multithreading


import Foundation


protocol Worker {
    func work()

}

protocol WorkerEat {
    func eat()
}



class Robot: Worker {
    func work() {
        // Робот работает
    }
}

class Human: Worker, WorkerEat {
    func work() {

    }

    func eat() {

    }
}
