//
//  ViewController.swift
//  loadData
//
//  Created by 郑永恒 on 2017/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    
    @IBAction func secound(_ sender: Any) {
        
        let con = TableViewController1()
        self.navigationController?.pushViewController(con, animated: true)
        
        
    }
    
    @IBAction func nextcon(_ sender: Any) {

        let con = TabViewController2()
        self.navigationController?.pushViewController(con, animated: true)
        
    }

    


}

