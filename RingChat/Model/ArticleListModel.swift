//
//  ArticleListModel.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/18.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit

class ArticleListModel: NSObject {
    
    /**< ID */
    var id:String!
    /**< 图片地址 */
    var imageArray:NSArray?
    /**< 标题 */
    var title:String!
    /**< 类型 */
    var type:NSNumber!
    
    func initWithDictionary(dic:NSDictionary) ->ArticleListModel{
        
        if Utils.isValidDictionary(dic){
            
            id = dic.objectForKey("id") as! String
            imageArray = dic.objectForKey("images") as? NSArray
            title = dic.objectForKey("title") as! String
            type = dic.objectForKey("id") as! NSNumber
        }
        
        return self
    }
    
    internal init(dic:NSDictionary) {
        
        if Utils.isValidDictionary(dic){
            
            let tempID = dic.objectForKey("id") as! NSNumber
            id = tempID.description
            imageArray = dic.objectForKey("images") as? NSArray
            title = dic.objectForKey("title") as! String
            type = dic.objectForKey("id") as! NSNumber
        }
    }
}
