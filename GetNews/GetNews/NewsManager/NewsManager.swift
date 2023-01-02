//
//  NewsManager.swift
//  GetNews
//
//  Created by batuhan on 17.12.2022.
//

import Foundation
protocol NewsManagerProtocol{
    func getNews(url:UrlCategories,completion:@escaping([Article]?,String?)->Void)
}
final class NewsManager: NewsManagerProtocol{
    static let shared = NewsManager()
    
    func getNews(url:UrlCategories ,completion:@escaping([Article]?,String?)->()){
        let urlNews = NetworkHelper.shared.returnURL(category: url)
        NetworkManager.shared.request(type: Haberler.self, url: urlNews) { response in
            switch response {
            case .success(let items):
                completion(items.articles, nil)
            case .failure(_):
                completion(nil, nil)
            }
        }
    }
}


