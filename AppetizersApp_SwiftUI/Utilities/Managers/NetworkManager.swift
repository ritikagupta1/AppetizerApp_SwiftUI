//
//  NetworkManager.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 11/01/25.
//

import Foundation
import UIKit
enum AppetiserError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

final class NetworkManager {
    private init() {}
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private var imageCache = NSCache< NSString, UIImage>()
    
//    func getAppetisers(completion: @escaping(Result<[Appetiser],AppetiserError>) -> Void) {
//        
//        guard let url = URL(string: baseURL + "appetizers") else {
//            completion(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            if error != nil {
//                completion(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let appetiserResponse = try decoder.decode(AppetiserResponse.self, from: data)
//                completion(.success(appetiserResponse.request))
//            } catch {
//                completion(.failure(.invalidData))
//                return
//            }
//        }
//        
//        task.resume()
//        
//    }
    
    func getAppetisers() async throws -> [Appetiser] {
        guard let url = URL(string: baseURL + "appetizers") else {
            throw AppetiserError.invalidURL
        }
        
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw AppetiserError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let appetiserResponse = try decoder.decode(AppetiserResponse.self, from: data)
            return appetiserResponse.request
        } catch {
            throw AppetiserError.invalidData
        }
    }
    
    func downloadImage(fromUrlString urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = imageCache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.imageCache.setObject(image, forKey: NSString(string: urlString))
            completion(image)
        }
        task.resume()
    }
}
