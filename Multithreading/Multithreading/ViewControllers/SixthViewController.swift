//
//  SixthViewController.swift
//  Multithreading


import UIKit

final class SixthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("A")
                
        DispatchQueue.main.async {
            print("B")
        }
            
        print("C")
    }
}

//Выведется А С В
//Принт А стоит перед всеми - сначала он, потом принт С, потому, что главная очередь
//продолжит свою работу, так как у глобал стоит асинк, соответственно последним В
//проверила всё верно так и вывелось
