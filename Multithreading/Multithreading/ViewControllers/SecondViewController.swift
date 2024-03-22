//
//  SecondViewController.swift
//  Multithreading
//
//  Created by Киса Мурлыса on 22.03.2024.
//

import UIKit

final class SecondViewController: UIViewController {

    let phrases: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let phrasesService = PhrasesService2()
        
        
        for i in 0..<10 {
            DispatchQueue.global().async {
                Task {
                    await phrasesService.addPhrase("Phrase \(i)")
                }
            }
        }
        Thread.sleep(forTimeInterval: 1)
        
        Task {
            let phrases = await phrasesService.phrases
            print(phrases)
        }
        
    }

}

actor PhrasesService2 {
    var phrases: [String] = []
    func addPhrase(_ phrase: String) async {
        phrases.append(phrase)
    }
}
