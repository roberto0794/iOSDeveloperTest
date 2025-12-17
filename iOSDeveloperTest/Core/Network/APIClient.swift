//
//  APIClient.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import Foundation
import UIKit

final class APIClient {
    
    static let shared = APIClient()
    private init(){}
    
    func request <T: Decodable>(endpoint: APIService, completion: @escaping(Result<T, NetworkError>) -> Void) {
    
        guard let url = endpoint.url else {
            completion(.failure(.invalidURL))
            return
        }
            
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            if let error = error as? URLError {
                DispatchQueue.main.async {
                    completion(.failure(error.code == .notConnectedToInternet ? .noInternet : .unknow))
                }
                
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                DispatchQueue.main.async {
                    completion(.failure(.serverError(httpResponse.statusCode)))
                }
                
                return
            }
            
            guard let data else {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                
                return
            }
                
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            }
            catch {
                print("DECODING ERROR:", error)
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
