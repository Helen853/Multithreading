//
//  ViewController.swift
//  Multithreading
/*
 нарушает принцип единственной ответственности (с)
 потому что в одном классе содержатся методы и получения данных и обновление Юай
 Юай должен обновляться в контроллере
 */

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateUI() {
        // обновляет пользовательский интерфейс
    }
}


class NetworkManager {

    func fetchData(url: URL) {
        //получаем данные
    }
}


class Presenter {
    var network: NetworkManager?
    var view: ViewController?
    
    func returnData() {
        network?.fetchData(url: <#T##URL#>)
        view?.updateUI()
    }
}


