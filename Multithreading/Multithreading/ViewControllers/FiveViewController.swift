//
//  FiveViewController.swift
//  Multithreading
//
//  Created by Киса Мурлыса on 22.03.2024.
//Data Race (Гонка за данными)

import UIKit

final class FiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var sharedResource = 0
        let semaphore = DispatchSemaphore(value: 1)

       DispatchQueue.global(qos: .background).async {
           semaphore.wait()
           for _ in 1...100 {
               sharedResource += 1
               print(sharedResource)
           }
           
           semaphore.signal()
           
       }

      DispatchQueue.global(qos: .background).async {
          semaphore.wait()
          for _ in 1...100 {
              sharedResource += 1
              print(sharedResource)
          }
          semaphore.signal()
      }
    }
}
