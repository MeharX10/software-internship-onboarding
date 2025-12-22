import Foundation

// Generic NetworkManager class
class NetworkManager {

    static let shared = NetworkManager()
    private init() {}

    // Generic GET request
    func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 404)))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
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
