//
//  BaseViewController.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/17.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        createBackArrow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 创建返回按钮
    
    func createBackArrow(){
        
        let button = UIButton(frame: CGRectMake(0, 0, 17, 17))
        button.setBackgroundImage(UIImage(named: "Navigation_Back"), forState: UIControlState.Normal)
        button.addTarget(self, action: "goBack", forControlEvents: UIControlEvents.TouchUpInside)
        
        let item = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = item
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func goBack(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
