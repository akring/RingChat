//
//  NetworkKit.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/19.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit
import Alamofire

let defaultTimeout:NSTimeInterval = 15 /**< 15秒超时 */

class NetworkKit: NSObject {
    
    /**
     检测网络是否可用
     
     - returns: 是否可用
     */
    class func isReachable()->Bool{
        
        let status = Reach().connectionStatus()
        
        switch status{
        case .Unknown, .Offline:
            return false
        default:
            return true
        }
    }
    
    class func getRequest(url:NSURL,timeout:NSTimeInterval)->NSMutableURLRequest{
        
        let cachePolicy:NSURLRequestCachePolicy = isReachable() ? .ReloadIgnoringLocalCacheData:.ReturnCacheDataElseLoad
        let request = NSMutableURLRequest(URL: url, cachePolicy: cachePolicy, timeoutInterval: timeout)
        request.addValue("private", forHTTPHeaderField: "Cache-Control")
        
        return request
    }
    
    class func request(urlString:String, callback:(response:Response<AnyObject, NSError>)->Void){
        
        let url = NSURL(string:API_ADDRESS+urlString)!
        
        let manager = Alamofire.Manager.sharedInstance
        manager.request(getRequest(url, timeout: defaultTimeout)).responseJSON { (response) -> Void in
            
            if response.result.error != nil{
                
                print(response.result.error?.localizedDescription)
            }
            else{
                callback(response: response)
            }
        }
    }
}
