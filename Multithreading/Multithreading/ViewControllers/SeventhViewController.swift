//
//  SeventhViewController.swift
//  Multithreading


import UIKit

final class SeventhViewController: UIViewController {
    var lock = NSLock()
    
    private lazy var name = "I love RM"

    override func viewDidLoad() {
        super.viewDidLoad()
        updateName()

    }
    
    func updateName() {
        DispatchQueue.global().async { [ weak self ] in
            self?.lock.lock()
            print(self?.name)
            print(Thread.current)
            self?.lock.unlock()
        }
        lock.lock()
        print(self.name)
        lock.unlock()
    }
}

//гонка состояний. lazy var одновременно пытаются обратиться два разных потока
