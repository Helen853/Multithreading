//
//  SixViewController.swift
//  Multithreading


import UIKit

final class SixViewController: UIViewController {

    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            let result = await fetchMessagesResult()
            print(result)
        }
    }
    
    func fetchMessagesResult() async -> [Message] {
        do {
            return try await withCheckedThrowingContinuation { continuation in
                networkService.fetchMessages { messages in
                    if messages.isEmpty {
                        continuation.resume(throwing: Error.self as! Error)
                    } else {
                        continuation.resume(returning: messages)
                    }
                }
            }
        } catch {
            return [
                Message(id: 0, from: "", message: "")
            ]
        }
    }
}
