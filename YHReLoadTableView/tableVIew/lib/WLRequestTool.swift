//
//  WLRequestTool.swift
//  zwl_swift
//
//  Created by Askey on 2016/12/8.
//  Copyright © 2016年 Askey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//#if DEBUG
private let baseUrl = "http://121.43.189.169/App/"
////private let baseUrl = "http://zwl.test.kh888.cn/App/"
//#else
//private var baseUrl = "http://zwl.test.kh888.cn/App/"
//#endif

//Withdrawals/Withdrawals

let kMineWithdrawalsWithdrawals = "Withdrawals/Withdrawals"

//private let baseUrl = "http://192.168.1.163/App/"


func request(url: String, parameters: [String : Any]?, requestBack: @escaping ((_ success:Bool, _ value:JSON?, _ message: String) -> Void)) {

    Alamofire.request(baseUrl + url, method: .post, parameters: parameters ?? nil).responseJSON { response in
        if response.result.isSuccess {
            var json = JSON.init(data: response.data!)

            let status = json["code"].int!
            if status == 200 {  // 请求成功
                requestBack(true, json, json["message"].stringValue)
            } else {
                requestBack(false, nil, json["message"].stringValue)
            }
        } else {
            requestBack(false, nil, "请检查网络连接")
        }
    }
}





