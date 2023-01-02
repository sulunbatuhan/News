//
//  NetworkHelper.swift
//  GetNews
//
//  Created by batuhan on 14.12.2022.
//

import Foundation

final class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseUrl = "https://newsapi.org/v2/top-headlines?country=tr&category="
    private let apiKey = "&apiKey=ad375d9a04584a3d91b995522139b4e8"
   
    func returnURL(category:UrlCategories)->String{
        let link = "\(baseUrl)\(category.rawValue)\(apiKey)"
        return link
    }
}

enum ErrorTypes : Error{
    case invalidData
    case invalidURL
}

enum UrlCategories:String{
    case business
    case science
    case sports
    case technology
}



