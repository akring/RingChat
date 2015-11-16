//
//  MessageCell.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/16.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet var avatarIV:UIImageView!
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var messageLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
