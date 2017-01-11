//
//  YHBaseTableVIewCell.swift
//  loadData
//
//  Created by 郑永恒 on 2017/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class YHBaseTableVIewCell: UITableViewCell {

    var model:YHBaseModel?
    
    class func setCellWith(tableView: UITableView, indexPath: IndexPath, cellType: YHBaseTableVIewCell.Type) -> (YHBaseTableVIewCell) {
        let ID = "reuseIdentifier"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: ID) as? YHBaseTableVIewCell
        
        if cell == nil {
            
            cell = cellType.init(style: UITableViewCellStyle.default, reuseIdentifier: ID)
        }
        
        return cell!
    }

    
    required override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
