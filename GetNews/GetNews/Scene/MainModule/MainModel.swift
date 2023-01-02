//
//  MainModel.swift
//  GetNews
//
//  Created by batuhan on 14.12.2022.
//

import Foundation

protocol MainModelProtocol{
    func didload()
    func fetch(url:UrlCategories,completion:@escaping((String?)->()))
    func setDelegate(output:MainUIProtocol)
    var view : MainUIProtocol?{get set}
    var newsManager : NewsManagerProtocol{get}
    var articles : [Article] {get}
}

final class MainModel{
    weak var view : MainUIProtocol?
    var articles = [Article]()
    var newsManager: NewsManagerProtocol
    
    init(){
        newsManager = NewsManager()
    }
    
    func setDelegate(output: MainUIProtocol) {
        view = output
    }
    
    func fetch(url:UrlCategories,completion:@escaping((String?)->())){
        newsManager.getNews(url: url){ articles,error  in
            if let items = articles{
                self.articles = items
            }
            completion(error)}
    }
    
    var count : Int{
        return self.articles.count
    }
    func cellForRowData(indexPath:Int)->Article{
        let row = articles[indexPath]
        let model = DetailVM(article: row)
        return row
    }
}


extension MainModel : MainModelProtocol {
    func didload() {
        view?.setRefresh()
        view?.setTableView()
    }
    
}

