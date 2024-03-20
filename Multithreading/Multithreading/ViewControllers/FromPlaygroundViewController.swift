//
//  FromPlaygroundViewController.swift
//  Multithreading

import UIKit

final class FromPlaygroundViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print(2)
        DispatchQueue.main.async {
            print(3)
            DispatchQueue.main.async {
                print(5)
            }
            print(4)
        }
        print(6)
     }

}

//let vc = FromPlaygroundViewController()
//print(1)
//let view = vc.view
//print(7)

//Думаю будет блокировка где синхронно указано во втором блоке
/* Будет 2(потому что первым идет), 6(потому что продолжает выполнять паралельно асинхронному), 3, 1, 7
 2,6,3,1,7
 */
//Всё напутала вывелось по другому - 1 2 6 7 3, пошла разбираться
// когда мы только проинициализоравли контроллер вью дид лоад еще не вызвался,  вью дидлоад вызвался потому что мы дернули vc.view из-за этого сначала принт 1 был, а потом из контроллера принты

