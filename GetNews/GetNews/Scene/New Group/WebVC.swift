//
//  WebVC.swift
//  GetNews
//
//  Created by batuhan on 20.12.2022.
//

import UIKit
import WebKit

final class WebVC: UIViewController {

   @IBOutlet weak var webView: WKWebView!
    
    var request : URLRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let request = request{
            print("\(request)**************request")
            webView.load(request)
        }
      //  let url = URL(string: "https://www.haberturk.com/")
       // let request = URLRequest(url: url!)
        
    }
    

    
    // MARK: - Navigation


}
