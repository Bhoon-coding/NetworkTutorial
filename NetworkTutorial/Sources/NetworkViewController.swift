//
//  ViewController.swift
//  NetworkTutorial
//
//  Created by 이병훈 on 1/11/25.
//

import UIKit

class NetworkViewController: UIViewController {
    
    let jsonString: String = """
{
  "id": 1,
  "name": "John Doe",
  "details": {
    "address": {
      "city": "Seoul",
      "postalCode": "12345"
    },
    "contacts": {
      "email": "john.doe@example.com",
      "phone": "010-1234-5678"
    }
  }
}

"""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.decodeUserData()
    }
    
    private func decodeUserData() {
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                let user = try JSONDecoder().decode(User.self, from: jsonData)
                print("\(#function) - user: \(user)")
            }
            catch {
                print("Decoding error: \(error)")
            }
        }
    }
    
    // MARK: TODO 네트워크 통신
    
//    private var todos: [Todo] = []
//
//    func fetchTodos(completion: @escaping (Result<[Todo], Error>) -> Void) {
//        let url: URL = URL(string: "https://jsonplaceholder.typicode.com/todos")!
//        let request: URLRequest = .init(url: url)
//        
//        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
//                
//                if let error = error {
//                    print("network Error: \(error)")
//                    completion(.failure(error))
//                    return
//                }
//                
//                if let data = data {
//                    do {
//                        let decodedData = try JSONDecoder().decode([Todo].self, from: data)
//                        completion(.success(decodedData))
//                    }
//                    catch {
//                        print("decoding Error: \(error)")
//                    }
//                }
//        }
//        dataTask.resume()
//    }


}




