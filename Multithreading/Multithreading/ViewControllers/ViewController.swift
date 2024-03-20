//
//  ViewController.swift
//  Multithreading

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            print("o")
            
            DispatchQueue.main.async {
                print("a")
            }
        }
        DispatchQueue.global().async {
            print("d")
        }
        
        Thread.detachNewThread {
            for _ in (0..<10) {
                 let currentThread = Thread.current
                 print("1, Current thread: \(currentThread)")
              }
        }

          for _ in (0..<10) {
             let currentThread = Thread.current
             print("2, Current thread: \(currentThread)")
          }
    }


}

