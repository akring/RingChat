//
//  CacheManager.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/18.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit

class CacheManager: NSObject {
    /**
     存入缓存
     
     - parameter object: 对象
     - parameter key:    键值
     */
    class func cacheObjectWithKey(object:AnyObject,key:String){
        
        let manager:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if object is Bool{
            manager.setBool(object as! Bool, forKey: key)
        }
        else if object is Double{
            manager.setDouble(object as! Double, forKey: key)
        }
        else if object is Float{
            manager.setFloat(object as! Float, forKey: key)
        }
        else if object is Int{
            manager.setInteger(object as! Int, forKey: key)
        }
        else if object is NSURL{
            manager.setURL(object as? NSURL, forKey: key)
        }
        else{
            manager.setObject(object, forKey: key)
        }
    }
    /**
     获取缓存内容
     
     - parameter object: 对象
     - parameter key:    键值
     */
    class func getObjectWithKey(key:String)->AnyObject{
        
        let manager:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        return manager.objectForKey(key)!
    }
}
