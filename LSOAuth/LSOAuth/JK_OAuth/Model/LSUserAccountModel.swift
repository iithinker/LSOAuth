//
//  LSUserAccountModel.swift
//  LSOAuth
//
//  Created by WangBiao on 2016/10/29.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

/**
 Token模型
 示例：
     Optional({
     "access_token" = "2.008DBlXGvosFtC154cf1a014lU3LGC";
     "expires_in" = 157679999;
     "remind_in" = 157679999;
     uid = 5995621553;
     })
 */
class LSUserAccountModel: NSObject, NSCoding {
    /// Token用户授权的唯一票据
    var access_token: String?
    /// access_token的生命周期，单位是秒数
    var expires_in:TimeInterval = 0{
        didSet{
            expires_Date = Date().addingTimeInterval(expires_in)
        }
    }
    /// 授权用户的UID
    var uid: String?
    /// 用户头像
    var avatar_large: String?
    /// 用户昵称
    var screen_name: String?
    /// 过期时间
    var expires_Date: Date?
    
    func encode(with aCoder: NSCoder) {
        self.yy_modelEncode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.yy_modelInit(with: aDecoder)
    }
    
    /// descripition
    override var description: String{
        let keys = ["access_token", "expires_Date", "uid", "avatar_large", "screen_name"]
        return dictionaryWithValues(forKeys: keys).description
    }
    
    override init() {
        super.init()
    }
}
