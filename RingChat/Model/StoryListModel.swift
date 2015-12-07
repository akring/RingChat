//
//  StoryListModel.swift
//  RingChat
//
//  Created by 吕俊 on 15/12/7.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit
import ModelRocket

class StoryListModel: Model {

    let id = Property<String>(key: "id")
    
    let imageArray = PropertyArray<String>(key:"images")
    
    let title = Property<String>(key: "title")
    
    let type = Property<NSNumber>(key: "id")
}
