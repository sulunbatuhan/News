//
//  DetailVC.swift
//  GetNews
//
//  Created by batuhan on 15.12.2022.
//

import UIKit
import Kingfisher

protocol DetailVCProtocol:AnyObject{
    func showDetail(detail : Article)
}

final class DetailVC: UIViewController {
    
    var detailVM : DetailVMProtocol!
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailContent: UILabel!
    @IBOutlet weak var detailSource: UILabel!
    
   
    var url : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailVM.didLoad()
        detailVM.view = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
       /* let placeHolder = UIImage(named: "newspaper")
        if let news = news {
            if let url = URL(string: news.urlToImage ?? "newspaperimg"){
                detailImage.kf.setImage(with: url,placeholder: placeHolder)}
            url = URL(string: news.url)
            detailTitle.text = news.title
            detailContent.text = news.content
            detailSource.text = news.source.name
        }*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = sender as? URLRequest{
            if let target = segue.destination as? WebVC{
                target.request = url
            }
        }
    }
    // MARK: - Navigation
    
    
    @IBAction func tappedWebsiteURL(_ sender: UIButton) {
        let request = URLRequest(url: url!)
        performSegue(withIdentifier: "ToWeb", sender: request)
    }
    
}


extension DetailVC : DetailVCProtocol{
    func showDetail(detail: Article) {
        detailTitle.text = detail.title
        detailSource.text = detail.source.name
        detailContent.text = detail.content
        url = URL(string: detail.url)
    }
    
    
}
