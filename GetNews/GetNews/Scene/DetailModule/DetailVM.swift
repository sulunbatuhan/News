//
//  DetailVM.swift
//  GetNews
//
//  Created by batuhan on 15.12.2022.
//

import Foundation

protocol DetailVMProtocol{
    func didLoad()
    var view : DetailVCProtocol?{get set}

}

final class DetailVM{
   weak var view: DetailVCProtocol?
    private let article : Article
    
    init(article: Article) {
        self.article = article
    }
    
}



extension DetailVM:DetailVMProtocol{
    func didLoad() {
        view?.showDetail(detail: article)
    }
    
   
    
}
