//
//  FourthViewController.swift
//  Multithreading

import UIKit

final class FourthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func randomD6() async -> Int {
            Int.random(in: 1...6)
        }
        Task {
            let result = await randomD6()
            print(result)
        }
    }
}
