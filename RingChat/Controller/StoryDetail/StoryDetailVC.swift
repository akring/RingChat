//
//  StoryDetailVC.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/23.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit
import Toucan

class StoryDetailVC: BaseViewController,UIWebViewDelegate {

    var storyIV:UIImageView!
    
    var model:ArticleListModel!
    var dataModel:StoryModel!
    
    @IBOutlet var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        
        requestData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = true
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Fade)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Fade)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 初始化
    func initImageView(imageURL:String){
        
        storyIV = UIImageView(frame: CGRectMake(0, 0, CGRectGetWidth(self.webView.frame), 220))
        storyIV.contentMode = UIViewContentMode.ScaleToFill
        self.storyIV.kf_setImageWithURL(NSURL(string: imageURL)!, placeholderImage: nil, optionsInfo: nil) { (image, error, cacheType, imageURL) -> () in
            
            let resize = Toucan(image: self.storyIV.image!).resize(self.storyIV.frame.size, fitMode: Toucan.Resize.FitMode.Crop)
            self.storyIV.image = resize.image
        }
        self.webView.scrollView.addSubview(storyIV)
    }

    // MARK: - 请求数据
    func requestData(){
        
        NetworkKit.request("news/"+model.id) { (response) -> Void in
            
            if response.result.error != nil{
                
                print(response.result.error?.localizedDescription)
            }
            else{
                let result:AnyObject? = response.result.value
                
                let JSON = result as! NSDictionary
                
                self.dataModel = StoryModel(dic: JSON)
                self.loadHtmlView()
                
            }
        }
    }
    
    // MARK: - 加载HTML，JS和CSS
    func loadHtmlView(){
        
        let temp = dataModel.css.firstObject as! String
        let css = NSURL(string: temp)
        let htmlStr="<html><head><link rel='stylesheet' href='"+temp+"' /></head><body>"+dataModel.body+"</body></html>"
        self.webView.loadHTMLString(htmlStr, baseURL: css)
    }
    
    // MARK: - WebView Delegate
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let temp = dataModel.css.firstObject as! String
        
        if request.URLString == temp{
            
            if self.storyIV == nil{
                self.initImageView(self.dataModel.imageUrl)
            }
            else{
                self.storyIV.hidden = false
            }
        }
        else{
            self.storyIV.hidden = true
        }
        
        return true
    }
    
    // MARK: - Navigation
    @IBAction func back(){
    
        super.goBack()
    }
    
}
