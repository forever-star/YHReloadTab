//
//  YHTableViewCell.swift
//  loadData
//
//  Created by 郑永恒 on 2017/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class YHTableViewCell: YHBaseTableVIewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var numberLable: UILabel!
    
    override var model: YHBaseModel?{
        didSet{
            let temp: Model2 = model as! Model2
            
            self.titleLable.text = temp.debts_province_id
            self.numberLable.text = temp.debts_city_id
        }
    }
    
    override class func setCellWith(tableView: UITableView, indexPath: IndexPath, cellType: YHBaseTableVIewCell.Type) -> (YHBaseTableVIewCell) {
        let ID = "YHTableViewCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            cell = Bundle.main.loadNibNamed("YHTableViewCell", owner: nil, options: nil)?.first as! YHTableViewCell?
        }
        
        return cell as! (YHBaseTableVIewCell)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
