//
//  TenViewController.swift
//  Multithreading
//
//  Created by Киса Мурлыса on 22.03.2024.
//

import UIKit

class TenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let operationFirst = RMOperation(priority: .userInitiated, isFinished: false)
        let operationSecond = RMOperation(priority: .background, isFinished: false)
        
        
        //operationFirst.priority = .userInitiated
        operationFirst.completionBlock = {
            
            for _ in 0..<50 {
                print(2)
            }
            print(Thread.current)
            print("operationFirst полностью завершена!")
        }
        
        operationFirst.start()
        
        
       // operationSecond.priority = .background
        operationSecond.completionBlock = {
            
            for _ in 0..<50 {
                print(1)
            }
            print(Thread.current)
            print("operationSecond полностью завершена!")
        }
        operationSecond.start()
    }
}

protocol RMOperationProtocol {
    // Приоритеты
    var priority: DispatchQoS.QoSClass { get }
    // Выполняемый блок
    var completionBlock: (() -> Void)? { get }
    // Завершена ли операция
    var isFinished: Bool { get }
    // Метод для запуска операции
    func start()
}

class RMOperation: RMOperationProtocol {
    
    var priority: DispatchQoS.QoSClass
    
    var completionBlock: (() -> Void)?
    
    var isFinished: Bool
    
    init(priority: DispatchQoS.QoSClass, completionBlock: ( () -> Void)? = nil, isFinished: Bool) {
        self.priority = priority
        self.completionBlock = completionBlock
        self.isFinished = isFinished
    }
    
    /// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.

    func start() {
        completionBlock?()
    }
}

class RMOperationQueue {
    private var queue = [RMOperation]() {
        didSet {
            perform()
        }
    }
    
    func addOperation(_ operation: RMOperation) {
        queue.append(operation)
    }
    
    func getOperation() -> RMOperation? {
        queue.last
    }
    
    func deleteOperation() {
        queue.removeLast()
    }
    
    private func perform() {
        let _queue = queue
        _queue.reversed().forEach {
            $0.start()
            queue.removeLast()
        }
    }
}



