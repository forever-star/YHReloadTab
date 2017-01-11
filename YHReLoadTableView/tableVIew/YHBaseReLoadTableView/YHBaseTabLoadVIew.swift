//
//  YHBaseTabLoadVIew.swift
//  loadData
//
//  Created by 郑永恒 on 2017/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit
import MJRefresh
import SwiftyJSON





class YHBaseTabLoadVIew: UITableViewController {
    
    //页数
    var pageNum: Int = 1
    //请求链接
    var urlStr = ""
    //请求参数
    var parameters: Dictionary<String , Any>?
    
    /*
     回调转模型 子类如果需要重写转模型的逻辑,给这个闭包赋值
     闭包返回请求到的数据
    **/
    var setModel: (([Any]) -> ([YHBaseModel]))?
    
    //model类型
    
    var modelType: YHBaseModel.Type = YHBaseModel.self
    
    //cell 类型   
    var cellType: YHBaseTableVIewCell.Type = YHBaseTableVIewCell.self
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    //初始化方法
    init(parameter: Dictionary<String , Any>?,urlStr: String){
        
        self.urlStr = urlStr
        parameters = parameter
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        loadUI()
        loadData()
    }

    //数据源数组
    lazy var dataArr: Array<AnyObject> = {
        let arr = Array<AnyObject>()
        
        
        return arr
    }()

}

// MARK: - 创建 UI
extension YHBaseTabLoadVIew{
    //创建 ui
    func loadUI() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.tableView.mj_header.beginRefreshing()
            self.tableView.mj_footer.endRefreshing()
            self.pageNum = 1
            self.loadData()
        })
        
        self.tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            self.tableView.mj_footer.beginRefreshing()
            self.pageNum += 1
            self.loadData()
        })
        
    }

}

// MARK: - 请求数据
extension YHBaseTabLoadVIew {
    
    //数据请求
    func loadData(){
        
        request(url: urlStr, parameters: parameters) { (result, json, message) in
            if result == true {
                
                guard let data = json!["data"].array else {
                    return
                }
                
                if data.count > 0 {
                    if self.tableView.mj_header.isRefreshing(){
                        self.dataArr.removeAll()
                    }
                    self.mj_endRef()
                }else{
                    self.tableView.mj_footer.endRefreshingWithNoMoreData()
                }
                
                guard self.setModel != nil else {
                    //默认的 model 样式
                    for temp in data {
                        let model = self.modelType.init()
                        model.parseData(json: temp)
                        self.dataArr.append(model)
                    }
                    self.tableView.reloadData()
                    return
                }
                //如果子类自定义的模型规则
                self.dataArr = self.setModel!(data)
                
                self.tableView.reloadData()
            }else{
                self.mj_endRef()
            }
            
        }
    }
    
    //结束刷新
    func mj_endRef() {
        if self.tableView.mj_header.isRefreshing(){
            self.mj_HeaderEndRef()
        }else{
            self.mj_FooterEndRef()
        }
    }
    
    func mj_HeaderEndRef() {
        self.tableView.mj_header.endRefreshing()
    }
    
    func mj_FooterEndRef() {
        self.tableView.mj_footer.endRefreshing()
    }
    


}

// MARK: - Table 数据源
extension YHBaseTabLoadVIew {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.dataArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.cellType.setCellWith(tableView: tableView, indexPath: indexPath, cellType: self.cellType )
        
        let model = self.dataArr[indexPath.row]
        
        cell.model = model as? YHBaseModel
        
        return cell
    }
    

    
    
}
