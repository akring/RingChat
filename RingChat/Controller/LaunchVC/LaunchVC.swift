//
//  LaunchVC.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/18.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

class LaunchVC: UIViewController {

    @IBOutlet var launchImageView:UIImageView!/**< 启动页图片 */
    @IBOutlet var launchInfoLabel:UILabel!/**< 图片源信息 */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getLaunchImageInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - 获取图片源地址
    /**
    调用接口获取启动图片的地址
    */
    func getLaunchImageInfo(){
        
        NetworkKit.request("start-image/1080*1776") { (response) -> Void in
            
            if let result = response.result.value{
                
                let json = result as! NSDictionary
                
                let imageSrc = json.objectForKey("img") as? String
                let imageInfo = json.objectForKey("text") as? String
                
                if imageSrc != nil{
                    self.fetchLaunchImage(imageSrc!)
                }
                if imageInfo != nil{
                    self.launchInfoLabel.text = imageInfo
                }
            }
            else{
                
                let time: NSTimeInterval = 2.0
                let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
                dispatch_after(delay, dispatch_get_main_queue(), { () -> Void in
                    
                    self.performSegueWithIdentifier("showMainView", sender: self)
                })
            }
        }
    }
    /**
     获取并设置启动图片
     
     - parameter imageSrc: 图片源地址
     */
    func fetchLaunchImage(imageSrc:String){
        
        launchImageView.kf_setImageWithURL(NSURL(string: imageSrc)!, placeholderImage: nil, optionsInfo: nil) { (image, error, cacheType, imageURL) -> () in
            
            //延迟两秒之后跳转到主界面
            let time: NSTimeInterval = 2.0
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
            dispatch_after(delay, dispatch_get_main_queue(), { () -> Void in
                
                self.performSegueWithIdentifier("showMainView", sender: self)
            })
        }
    }
    
}
