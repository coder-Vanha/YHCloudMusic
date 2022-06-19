//
//  HomeViewController.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/19.
//  Copyright © 2022 wanwan. All rights reserved.
//

import UIKit
import Alamofire
import KakaJSON
import MJRefresh
import SwiftyJSON
import KingfisherWebP

class HomeViewController: UIViewController {
     
    lazy var tableView = UITableView()
    
    static let ItemCellID = "ItemCellID" // 建议用static 不然每个控制器都会有一份这样的内存没有必要
    lazy var items = [HomeItem]()
    
    var page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        view.backgroundColor = UIColor.red
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.ItemCellID) // 访问类型属性，要用大写Self
        view.addSubview(tableView)
        
        let header = MJRefreshNormalHeader(refreshingBlock: self.loadData)
        header.beginRefreshing()
        tableView.mj_header = header
        
        let footer = MJRefreshAutoNormalFooter(refreshingBlock: self.loadMoreData)

        // Do any additional setup after loading the view.
    }
    

    func loadData() {
        request("",parameters: ["page":1]).responseJSON { [weak self] response in
            guard let dic = response.value else { return }
            let jsons = JSON(dic)["items"].arrayObject
            
            guard let models = jsons?.kj.modelArray(HomeItem.self) else { return }
           // guard let models = modelArray(from: jsons!, HomeItem.self) else { return }
            
            self?.items.append(contentsOf:models)
            self?.tableView.reloadData()
            self?.tableView.mj_header!.endRefreshing()
            
            self?.page = 1
                    
        }
        
       
    }
    
    func loadMoreData() {
        request("",parameters: ["page":1]).responseJSON { [weak self] response in
            guard let dic = response.value else {return}
            let jsons = JSON(dic)["items"].arrayObject
            guard let models = jsons?.kj.modelArray(HomeItem.self) else { return }
           // guard let models = modelArray(from: jsons, HomeItem.self) else { return }
            
            self?.items.append(contentsOf:models)
            self?.tableView.reloadData()
            self?.tableView.mj_footer!.endRefreshing()
            
            self?.page += 1
        }
    }

}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.mj_footer?.isHidden = items.count == 0
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.ItemCellID, for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.user.name
       // cell.imageView?.kf.setImage(with:URL(string: item.user.thumb)) // 直接下载webp
        let url = item.user.thumb.replacingOccurrences(of: ".webp", with: "png") // webp 转为 png 因为服务器也提供了以png结尾的图片
        cell.imageView?.kf.setImage(with:URL(string: url)) //
       
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
}
