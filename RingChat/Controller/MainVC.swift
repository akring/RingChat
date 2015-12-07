//
//  MainVC.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/16.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var tempOffset:CGFloat = 0
    @IBOutlet var tableView:UITableView!
    var dataSource:NSMutableArray = NSMutableArray()
    var enableAnimation:Bool = true
    
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Today"
        
        //隐藏导航栏下面的黑线
        self.navigationController?.hidesNavigationBarHairline = true
        
        initPullDownRefresh()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        requestData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        enableAnimation = false
    }
    
    deinit {
        
        tableView.dg_removePullToRefresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 初始化
    /**
    初始化下拉刷新
    
    - returns: 下拉刷新
    */
    func initPullDownRefresh(){
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.flatWhiteColor()
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            
            self?.requestData()
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshBackgroundColor(UIColor.flatWhiteColor())
        tableView.dg_setPullToRefreshFillColor(UIColor(hex: "3CC6AA"))
    }
    
    // MARK: - 请求数据
    func requestData(){
        
        NetworkKit.request("news/latest") { (response) -> Void in
            
            let result:AnyObject? = response.result.value
            
            let JSON = result as! NSDictionary
            
            let storyArray = JSON.objectForKey("stories") as? NSArray
            
            self.dataSource.removeAllObjects()
            
            for object in storyArray!{
                
                let dic = object as! NSDictionary
                let model:ArticleListModel = ArticleListModel(dic: dic)
                
                self.dataSource.addObject(model)
            }
            
            self.tableView.dg_stopLoading()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StoryListCell", forIndexPath: indexPath) as! StoryListCell
        
        let model = dataSource.objectAtIndex(indexPath.row) as! ArticleListModel
        
        cell.reloadCellWithModel(model)
        
        return cell
    }
    // MARK: - TableView Delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let vc = StoryDetailVC()
        vc.model = dataSource.objectAtIndex(indexPath.row) as! ArticleListModel
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - 缩放效果
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        enableAnimation = true
        let offset = scrollView.contentOffset.y
        tempOffset = offset
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        enableAnimation = false
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let offset = tableView.contentOffset.y
        
        let myCell:StoryListCell = cell as! StoryListCell
        
        if enableAnimation == false{
            
            return
        }
        
        if offset > tempOffset{
            
            myCell.bgView.curve = "spring"
            myCell.bgView.animation = "slideRight"
            myCell.bgView.animate()
            
            myCell.iconIV.curve = "spring"
            myCell.iconIV.animation = "slideRight"
            myCell.iconIV.animate()
            
            myCell.titleLabel.curve = "spring"
            myCell.titleLabel.animation = "slideRight"
            myCell.titleLabel.animate()
        }
        else{
            myCell.bgView.curve = "spring"
            myCell.bgView.animation = "slideLeft"
            myCell.bgView.animate()
            
            myCell.iconIV.curve = "spring"
            myCell.iconIV.animation = "slideLeft"
            myCell.iconIV.animate()
            
            myCell.titleLabel.curve = "spring"
            myCell.titleLabel.animation = "slideLeft"
            myCell.titleLabel.animate()
        }
    }
}
