//
//  FifthViewController.swift
//  Multithreading


import UIKit

final class FifthViewController: UIViewController {
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    
    private var name = "Введите имя"

    override func viewDidLoad() {
        super.viewDidLoad()

        updateName()
    }
    
    func updateName() {
        
        lockQueue.sync {
            self.name = "I love RM"
            print(self.name)
            print(Thread.current)
        }
            
        print(self.name)
        
        
    }
}

/*
 DispatchQueue.global().async
 Вывод:
 Введите имя
 I love RM
 
 Это случилось потому, что главная очередь продолжила свою работу и успела выполнить следующую инструкцию прежде, чем глобал присвоил I love RM.
 
 DispatchQueue.global().sync
 I love RM
 I love RM
 
 Метод sync поставил главную очередь на паузу до полного выполнения задания.
 
 */
