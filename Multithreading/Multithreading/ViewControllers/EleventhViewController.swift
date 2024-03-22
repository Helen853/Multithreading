//
//  EleventhViewController.swift
//  Multithreading
//
//  Created by Киса Мурлыса on 22.03.2024.
//

import UIKit

class EleventhViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rmOperationQueue = RMOperationQueue()
        
        let rmOperation1 = RMOperation(priority: .background, isFinished: false)
        // rmOperation1.priority = .background
        
        rmOperation1.completionBlock = {
            print(1)
        }
        
        let rmOperation2 = RMOperation(priority: .userInteractive, isFinished: false)
        //rmOperation2.priority = .userInteractive
        
        rmOperation2.completionBlock = {
            print(2)
        }
        
        
        rmOperationQueue.addOperation(rmOperation1)
        rmOperationQueue.addOperation(rmOperation2)        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
