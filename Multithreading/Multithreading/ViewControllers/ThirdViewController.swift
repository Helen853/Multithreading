//
//  ThirdViewController.swift
//  Multithreading

import UIKit

final class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let infinityThread = InfinityThread()
        infinityThread.start()
        
        sleep(2)
        print(infinityThread.isExecuting)
        sleep(3)
        infinityThread.cancel()
        print(infinityThread.isFinished)
    }
}

class InfinityThread: Thread {

    var counter = 0
    
    override func main() {
        while counter < 30 && !isCancelled {
            counter += 1
            print(counter)
            InfinityThread.sleep(forTimeInterval: 1)
        }
    }
}
