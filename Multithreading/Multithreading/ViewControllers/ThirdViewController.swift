//
//  ThirdViewController.swift
//  Multithreading

import UIKit

final class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let infinityThread = InfinityThread()
        infinityThread.start()
        print(infinityThread.isExecuting)
        
        sleep(2)
        infinityThread.cancel()
        print(infinityThread.isFinished)
    }
}

class InfinityThread: Thread {

    var counter = 0
    
    override func main() {
        while counter < 30 && !isCancelled {
            Timer.scheduledTimer(withTimeInterval: 0, repeats: true) { _ in
                self.counter += 1
                print(self.counter)
                InfinityThread.sleep(forTimeInterval: 1)
            }
            RunLoop.current.run(until: Date() + 5)
        }
    }
}
