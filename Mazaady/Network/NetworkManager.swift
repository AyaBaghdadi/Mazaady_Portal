//
//  NetworkManager.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import Foundation

// Singleton NetworkManager to manage API requests
class NetworkManager {
    static let shared = NetworkManager() // Singleton instance
    
    private init() {} // Private initializer to prevent initialization from outside
    
    // Static Base URL for all requests
    static let baseURL = "https://stagingapi.mazaady.com/api/interview-tasks"
    
    // Endpoints as static constants
    enum Endpoint: String {
        case tags = "/tags"
        case products = "/products"
        case advertisements = "/advertisements"
        case user = "/user"
        
        var urlString: String {
            return NetworkManager.baseURL + self.rawValue // Access static baseURL here
        }
    }
    
    // Generic function to fetch data from any endpoint
    func fetch<T: Codable>(from endpoint: Endpoint, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: endpoint.urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No Data", code: 404, userInfo: nil))
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(result, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func fetchArray<T: Codable>(from endpoint: Endpoint, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: endpoint.urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, NSError(domain: "No Data", code: 404, userInfo: nil))
                return
            }

            // Debugging: Print the raw response data
            print("Raw response data: \(String(data: data, encoding: .utf8) ?? "nil")")

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(result, nil)
            } catch {
                print("Decoding error: \(error)")
                completion(nil, error)
            }
        }
        task.resume()
    }

}
