//
//  Utils.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/18.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit
import Alamofire

class Utils: NSObject {
    /**
     获取当前版本号
     */
    class func getVersion(){
        
        let url:String = API_ADDRESS+"version/ios/" + versionString
        Alamofire.request(.GET, NSURL(string: url)!).responseJSON { (response) -> Void in
            
            if let result = response.result.value{
                
                let JSON = result as! NSDictionary
                versionString = JSON.objectForKey("latest") as! String
            }
            else{
                print(response.result.error?.localizedDescription)
            }
        }
    }
    /**
     判断是不是nil对象
     
     - parameter object: 待判断的对象
     
     - returns: 是否为nil
     */
    class func isNillObject(object:AnyObject?)->Bool{
        
        if object == nil{
            return true
        }else{
            return false
        }
    }
    /**
     是否是可用的String
     
     - parameter string: 待判断的String
     
     - returns: 是否可用
     */
    class func isValidString(string:AnyObject?) ->Bool{
        
        let notNill = !self.isNillObject(string)
        let isStringType = string is String
        let notEmpty = string?.length > 0
        
        return notNill && isStringType && notEmpty
    }
    /**
     是否是可用的Array
     
     - parameter Array: 待判断的Array
     
     - returns: 是否可用
     */
    class func isValidArray(array:AnyObject?) ->Bool{
        
        let notNill = !self.isNillObject(array)
        let isArrayType = array is NSArray || array is NSMutableArray
        let notEmpty = array?.count > 0
        
        return notNill && isArrayType && notEmpty
    }
    /**
     是否是可用的Dictionary
     
     - parameter Dictionary: 待判断的Dictionary
     
     - returns: 是否可用
     */
    class func isValidDictionary(dictionary:AnyObject?) ->Bool{
        
        let notNill = !self.isNillObject(dictionary)
        let isDictionaryType = dictionary is NSDictionary || dictionary is NSMutableDictionary
        let notEmpty = dictionary?.count > 0
        
        return notNill && isDictionaryType && notEmpty
    }
    
}
