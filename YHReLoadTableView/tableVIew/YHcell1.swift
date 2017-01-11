//
//  YHcell1.swift
//  loadData
//
//  Created by 郑永恒 on 2017/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class YHcell1: YHBaseTableVIewCell {

    
    override var model: YHBaseModel?{
        didSet{
            self.textLabel?.text = model?.catid
            self.detailTextLabel?.text = model?.title
        }
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
