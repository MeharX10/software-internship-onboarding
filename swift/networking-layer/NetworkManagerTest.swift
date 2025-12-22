// swift/networking-layer/NetworkManagerTest.swift
import Foundation

struct Todo: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

let semaphore = DispatchSemaphore(value: 0)

NetworkManager.shared.fetchData(from: "https://jsonplaceholder.typicode.com/todos/1") { (result: Result<Todo, Error>) in
    switch result {
    case .success(let todo):
        print("Fetched Todo: \(todo)")
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
    semaphore.signal()
}

// wait up to 10 seconds
let _ = semaphore.wait(timeout: .now() + 10)
