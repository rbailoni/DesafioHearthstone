//
//  HearthstoneAPI.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static var baseURL = "https://omgvamp-hearthstone-v1.p.rapidapi.com/"
    static var rapidAPIHost = "x-rapidapi-host"
    static var rapidAPIHostValue = "omgvamp-hearthstone-v1.p.rapidapi.com"
    static var rapidAPIKey = "x-rapidapi-key"
    static var rapidAPIKeyValue = "2bcd858c46msh7c1c40b32fa92e3p11ec4bjsna81643e4138f"
    
    private init() {}
}

class HearthstoneAPI {
    public static let shared = HearthstoneAPI()
    var imageCache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func fetchResource<T: Decodable>(path: String?, completion: @escaping(Result<T, ResponseError>) -> Void) {
        let allowedCharacterSet = (CharacterSet(charactersIn: " ").inverted)
        let urlString = (Constants.baseURL + (path ?? "")).addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)
        guard let url = URL(string: urlString ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: getRequest(url: url)) { (data, _, _) in
            guard let jsonData = data else {
                completion(.failure(.noAvailableData))
                return
            }
            do {
                let response = try JSONDecoder().decode(T.self, from: jsonData)
                completion(.success(response))
            } catch {
                completion(.failure(.invalidJSONDecoder))
            }
        }
        dataTask.resume()
    }
    
    func fetchResourceArray<T: Decodable>(path: String?, completion: @escaping(Result<[T], ResponseError>) -> Void) {
        let allowedCharacterSet = (CharacterSet(charactersIn: " ").inverted)
        let urlString = (Constants.baseURL + (path ?? "")).addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)
        guard let url = URL(string: urlString ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: getRequest(url: url)) { (data, _, _) in
            guard let jsonData = data else {
                completion(.failure(.noAvailableData))
                return
            }
            do {
                let response = try JSONDecoder().decode([T].self, from: jsonData)
                completion(.success(response))
            } catch {
                completion(.failure(.invalidJSONDecoder))
            }
        }
        dataTask.resume()
    }
    
    private func getRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue(Constants.rapidAPIHostValue, forHTTPHeaderField: Constants.rapidAPIHost)
        request.addValue(Constants.rapidAPIKeyValue, forHTTPHeaderField: Constants.rapidAPIKey)
        return request
    }
    
    func getImage(path: String, completion: @escaping (UIImage) -> Void) {
        let allowedCharacterSet = (CharacterSet(charactersIn: " ").inverted)
        let urlString = path.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)
        guard  let url = URL(string: urlString ?? "") else {
            completion(#imageLiteral(resourceName: "backCard"))
            return
        }
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(#imageLiteral(resourceName: "backCard"))
                    return
                }
                
                let image = UIImage(data: data) ?? #imageLiteral(resourceName: "backCard")
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                completion(image)
            }.resume()
        }
    }
}
