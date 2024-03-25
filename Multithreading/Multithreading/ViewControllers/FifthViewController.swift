//
//  FifthViewController.swift
//  Multithreading

import UIKit

final class FifthViewController: UIViewController {
    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            let result = await fetchMessagesResult()
            print(result)
        }
    }
    
    func fetchMessagesResult() async -> [Message] {
        await withCheckedContinuation { continuation in
            networkService.fetchMessages { messages in
                continuation.resume(returning: messages)
            }
        }
    }
    
}

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}


class NetworkService {
    
    func fetchMessages(completion: @escaping ([Message]) -> Void) {
        let url = URL(string: "https://hws.dev/user-messages.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                    completion(messages)
                    return
                }
            }
            completion([])
        }
        .resume()
    }
}
