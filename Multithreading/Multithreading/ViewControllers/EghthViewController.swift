//
//  EghthViewController.swift
//  Multithreading
//
//  Created by Киса Мурлыса on 22.03.2024.
//

import UIKit

class EghthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = ArrayAdditionService()
        for i in 1...10 {
            service.addElement(i)
        }
        service.cancelAddition()
    }
    
}

class ArrayAdditionService {
    private var array = [Int]()
    private var pendingWorkItems = [DispatchWorkItem]()
    
    // Метод для добавления элемента в массив
    func addElement(_ element: Int) {
        // Создаем новую операцию для добавления элемента в массив
        let newWorkItem = DispatchWorkItem { [weak self] in
            self?.array.append(element)
            print("Элемент \(element) успешно добавлен в массив.")
        }
        
        // Сохраняем новую операцию
        pendingWorkItems.append(newWorkItem)
        
        // Даем пользователю время для отмены операции
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [ weak self ] in
            // Логика тут eсли операция не была отменена, выполняем ее
            // ...
            guard
                let lastWorkItem = self?.pendingWorkItems.last,
                lastWorkItem.isCancelled
            else {
                print("lastWorkItem не выполнена")
                return
            }
            print("lastWorkItem ВЫполнена")
            lastWorkItem.perform()
        }
    }
    
    // Метод для отмены операции добавления элемента в массив
    func cancelAddition() {
        guard let lastWorkItem = pendingWorkItems.last else {
            print("Нет операций для отмены.")
            return
        }
        lastWorkItem.cancel()
    }
}
