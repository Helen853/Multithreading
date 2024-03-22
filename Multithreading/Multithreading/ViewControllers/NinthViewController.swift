//
//  NinthViewController.swift
//  Multithreading
//
//  Created by Киса Мурлыса on 22.03.2024.
//

import UIKit

class NinthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    final class Post: Sendable {
            
    }

    enum State1: Sendable {
         case loading
         case data(String)
    }
            
    //была ошибка, потому что класс не подписан на сендабл был
    enum State2: Sendable {
         case loading
         case data(Post) // Out: Associated value 'data' of 'Sendable'-conforming enum 'State2' has non-sendable type 'ViewController.Post'
    }


}
