//
//  EighthViewController.swift
//  Multithreading


import UIKit

final class EighthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await printMessage()
        }
    }
    
    func printMessage() async {
        let string = await withTaskGroup(of: String.self) { group -> String in
            let words = ["Hello","My", "Road", "Map", "Group"]

            for word in words {
                group.addTask {
                    return word
                }
            }
            
            var collected = [String]()
            
            for await value in group {
                collected.append(value)
            }
            
            return collected.joined(separator: " ")
        }
        
        print(string)
    }
    
}
