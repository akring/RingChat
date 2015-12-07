//
//  LikeButton.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/24.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit
import Spring

typealias ClickBlock = ()->()/**< 点击Block */

class LikeButton: SpringButton {
    
    var clickBlock:ClickBlock!
    var shouldLayoutView:Bool = true
    /**< 普通图片 */
    @IBInspectable var normalImage:UIImage!
    /**< 选中图片 */
    @IBInspectable var selectedImage:UIImage!
    override var selected:Bool
        {
        didSet{
            if selected{
                self.iconIV.image = self.selectedImage
            }else{
                self.iconIV.image = self.normalImage
            }
        }
    }
    var iconIV:UIImageView!/**< 图标 */
    var countLabel:UILabel!/**< 计数 */
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.tintColor = UIColor.clearColor()
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shouldLayoutView{//只在初始化的时候执行一次
            
            let height = CGRectGetHeight(self.frame)
            
            iconIV = UIImageView(frame: CGRectMake(0, 0, height, height))
            iconIV.image = normalImage
            self.addSubview(iconIV)
            
            countLabel = UILabel(frame: CGRectMake(height, 0, CGRectGetWidth(self.frame)-height, height))
            countLabel.textAlignment = NSTextAlignment.Center;
            countLabel.textColor = UIColor.flatGrayColorDark();
            countLabel.font = UIFont.systemFontOfSize(500)
            countLabel.adjustsFontSizeToFitWidth = true
            countLabel.numberOfLines = 0
            countLabel.text = "1"
            self.addSubview(countLabel)
            
            shouldLayoutView = false
        }
    }
    
    // MARK: - 动画
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        super.touchesEnded(touches, withEvent: event)
        
        self.selected = !self.selected
        
        self.animation = "pop"
        self.curve = "easeOut"
        self.duration = 1.0
        self.animate()
        
        if self.clickBlock != nil{
            
            self.clickBlock()
        }
    }
}
