//
//  ThirdViewController.swift
//  Multithreading


import UIKit

final class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Task 1 is finished")
        
        Task.detached(priority: .userInitiated) {
            for i in 0..<50 {
                print(i)
            }
            print("Task 2 is finished")
        }
        
        print("Task 3 is finished")
    }
}
/*
 Task.detached выполняет задачу не на главном потоке. Это способ создания и запуска асинхронных задач, которые не являются частью структурированной иерархии параллелизма. Они независимы от своего родительского контекста и не наследуют его приоритет
 */
