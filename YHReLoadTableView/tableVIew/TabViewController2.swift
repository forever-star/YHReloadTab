//
//  firstTabViewController.swift
//  loadData
//
//  Created by 郑永恒 on 2017/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class TabViewController2: YHBaseTabLoadVIew {
    
    override func viewDidLoad() {
        
        parameters = ["debts_status" : 1,
                      "order_class" : "order_money",
                      "order_type" : "asc"]
        
        urlStr = "Asset/index"
        
        modelType = Model2.self
        
        cellType = YHTableViewCell.self
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
}
