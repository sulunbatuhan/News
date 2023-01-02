//
//  MainNewsCell.swift
//  GetNews
//
//  Created by batuhan on 14.12.2022.
//

import UIKit
import Kingfisher

final class MainNewsCell: UITableViewCell {
    
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func cellConfigure(title : String,rowImage : String){
        cellTitle.text = title
        let placeHolder = UIImage(named: "newspaper")
        if let url = URL(string:  rowImage ){
            self.cellImage.kf.setImage(with: url,placeholder: placeHolder) { result in
                switch result {
                case .success(_):
                    print("succes a photo")
                case .failure(_):
                    print("hata")
                }
            }
        }
        
    }
}
