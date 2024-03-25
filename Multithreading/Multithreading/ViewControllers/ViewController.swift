//
//  ViewController.swift
//  Multithreading

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        Task {
            print(2)
        }
        print(3)
    }
}

/*
 Вывод 1, 3, 2,
 Такой вывод получился потому что после принт 1 стоит асинхронная задача, главная очередь
 продолжила свою работу и успела выполнить следующую инструкцию прежде, чем асинхронная задача.
 
 Вывод не изменился, потому что Task - это асинхронная операция
 */

