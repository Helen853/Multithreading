//
//  FourthViewController.swift
//  Multithreading

import UIKit

final class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let theard1 = TheardPrintDemon()
        let theard2 = TheardPrintAngel()
        
//        theard1.qualityOfService = .background
//        theard2.qualityOfService = .userInitiated
        
//        theard1.qualityOfService = .userInitiated
//        theard2.qualityOfService = .background
        
        theard1.qualityOfService = .userInteractive
        theard2.qualityOfService = .userInteractive
        
        theard1.start()
        theard2.start()
    }

}

class TheardPrintDemon: Thread {
    override func main() {
        for _ in (0..<100) {
            print("1")
        }
                
    }
}

class TheardPrintAngel: Thread {
    override func main() {
        for _ in (0..<100) {
            print("2")
        }
    }
}
