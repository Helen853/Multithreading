//
//  ViewController.swift
//  Multithreading

import UIKit

class ViewController: UIViewController {

    private let semaphore = DispatchSemaphore(value: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let phrasesService = PhrasesService()

        DispatchQueue.global().async {
            self.semaphore.wait()

            for i in 0..<10 {
                phrasesService.addPhrase("Phrase \(i)")
            }

            Thread.sleep(forTimeInterval: 1)
            print(phrasesService.phrases)
            self.semaphore.signal()
        }
    }
}

class PhrasesService {
    var phrases: [String] = []

    func addPhrase(_ phrase: String) {
        phrases.append(phrase)
    }
}



