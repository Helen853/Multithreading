//
//  FourrthViewController.swift
//  Multithreading
//
//  Created by Киса Мурлыса on 22.03.2024.
//Deadlock (Взаимная блокировка)
//1) ждёт выполнения (2), а (2) ждёт завершения (1).


import UIKit

final class FourrthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let serialQueue = DispatchQueue(label: "com.example.myQueue", attributes: .concurrent)
        serialQueue.async {
           serialQueue.sync {
               print("This will never be printed.")
           }
        }
    }
}
