//
//  StoryListCell.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/18.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit
import Spring

class StoryListCell: UITableViewCell {

    @IBOutlet var bgView:SpringView!
    @IBOutlet var iconIV:SpringImageView!
    @IBOutlet var titleLabel:SpringLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.masksToBounds = true
        bgView.layer.cornerRadius = 5.0
        
        iconIV.layer.masksToBounds = true
        iconIV.layer.cornerRadius = 5.0
        
        self.backgroundColor = UIColor.flatWhiteColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reloadCellWithModel(model:StoryListModel){
        
        let title = model.title.value
        let imageURL = model.imageArray.first
        
        titleLabel.text = title
        iconIV.kf_setImageWithURL(NSURL(string: imageURL!)!)
    }

}
