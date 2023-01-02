//
//  ViewController.swift
//  GetNews
//
//  Created by batuhan on 14.12.2022.
//

import UIKit
import Kingfisher

protocol MainUIProtocol:AnyObject{
    func setTableView()
    func setRefresh()
   
}
final class MainVC: UIViewController {
    lazy var viewModel = MainModel()
    
    @IBOutlet private weak var newsTableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setDelegate(output: self)
        viewModel.didload()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData(url: .business)
    }
    
    @IBAction func categorySectionTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            getData(url: .business)
        }else if sender.selectedSegmentIndex == 1 {
            getData(url: .science)
        }else if sender.selectedSegmentIndex == 2 {
            getData(url: .sports)
        }else if sender.selectedSegmentIndex == 3 {
            getData(url: .technology)
        }
    }
    
    
    
   
}

//MARK: Extension func
extension MainVC{
    @objc private func refreshControlSystem(){
        getData(url: .business)
        self.refreshControl.endRefreshing()
    }
    
    private func getData(url:UrlCategories){
        viewModel.fetch(url: url) { error in
            if error != nil {
                print("error var burada")}
            DispatchQueue.main.async {
                self.newsTableView.reloadData()}
        }
    }
}

//MARK: Extension TableView
extension MainVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = viewModel.cellForRowData(indexPath: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! MainNewsCell
        cell.cellConfigure(title: row.title, rowImage: row.urlToImage ?? "newspaperimg")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = viewModel.cellForRowData(indexPath: indexPath.row)
        performSegue(withIdentifier: "ToDetail", sender: row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}

//MARK: ProtocolSettings
extension MainVC : MainUIProtocol{
   
   func setRefresh(){
        refreshControl.addTarget(self, action: #selector(refreshControlSystem), for: .valueChanged)
    }
   func setTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.refreshControl = refreshControl
    }
    
}
