//
//  TwelfthViewController.swift
//  Multithreading
//
//  Created by Киса Мурлыса on 22.03.2024.
//

import UIKit

class TwelfthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Использование
        let threadSafeArray = ThreadSafeArray()
        let operationQueue = OperationQueue()
        
        let firstOperation = FirstOperation(threadSafeArray: threadSafeArray)
        let secondOperation = SecondOperation(threadSafeArray: threadSafeArray)
        
        operationQueue.addOperation(firstOperation)
        operationQueue.addOperation(secondOperation)
        
        // Дождитесь завершения операций перед выводом содержимого массива
        operationQueue.waitUntilAllOperationsAreFinished()
        
        print(threadSafeArray.getAll())
    }
    
    
}

// Объявляем класс для для синхронизации потоков
class ThreadSafeArray {
//    private var lock = NSLock()
    private var array: [String] = []
    
//    func append(_ item: String) {
//        lock.lock()
//        array.append(item)
//        lock.unlock()
//    }
    
    private var semaphore = DispatchSemaphore(value: 1)
    
    func append(_ item: String) {
        semaphore.wait()
        array.append(item)
        semaphore.signal()
    }
    
    func getAll() -> [String] {
        return array
    }
}

// Определяем первую операцию для добавления строки в массив
class FirstOperation: Operation {
    let threadSafeArray: ThreadSafeArray
    
    init(threadSafeArray: ThreadSafeArray) {
        self.threadSafeArray = threadSafeArray
    }
    
    override func main() {
        if isCancelled { return }
        threadSafeArray.append("Первая операция")
    }
}

// Определяем вторую операцию для добавления строки в массив
class SecondOperation: Operation {
    // Создаем по образу первой операции
    let threadSafeArray: ThreadSafeArray
    
    init(threadSafeArray: ThreadSafeArray) {
        self.threadSafeArray = threadSafeArray
    }
    
    override func main() {
        if isCancelled { return }
        threadSafeArray.append("Первая операция")
    }
}

