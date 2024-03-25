//
//  SecondViewController.swift
//  Multithreading


import UIKit

final class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        Task { @MainActor  in
            print(2)
        }
        print(3)
        
    }
    

}

/*
 @MainActor заменяет DispatchQueue.main, позволяет выполнять задачу в главном потоке
 */
