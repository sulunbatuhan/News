//
//  NetworkManager.swift
//  GetNews
//
//  Created by batuhan on 14.12.2022.
//

import Foundation
protocol NetworkManagerProtocol{
    func request<T:Codable>(type :T.Type,url:String,completion:@escaping(Result<T,ErrorTypes>)->())
}

final class NetworkManager :NetworkManagerProtocol{
    static let shared = NetworkManager()
    
    func request<T:Codable>(type :T.Type,url:String,completion:@escaping(Result<T,ErrorTypes>)->()){
        guard let urlRequest = URL(string: url) else {return}
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data , response , error in
            if error != nil || data == nil{
                completion(.failure(ErrorTypes.invalidData))
            }
            if let data = data{
                do {
                    let news = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(news))
                }catch{
                    completion(.failure(.invalidData))
                }
            }
        }
        dataTask.resume()
    }
}
