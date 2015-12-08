//
//  StoryModel.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/23.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit
import ModelRocket

class StoryModel: Model {

    /**< 主体内容 */
    let body = Property<String>(key: "body")
    /**< 图片提供方 */
    let imageSource = Property<String>(key: "image_source")
    /**< 图片地址 */
    let imageUrl = Property<String>(key: "image")
    /**< 标题 */
    let title = Property<String>(key: "title")
    /**< 分享地址 */
    let shareUrl = Property<String>(key: "share_url")
    /**< JS */
    let jsSet = PropertyArray<String>(key: "js")
    /**< 分享者 */
    //let recommenders = Property<String>(key: "js")
    /****************栏目块***************/
    //let sectionThumbnail = Property<String>(key: "title")/**< 栏目缩略图 */
    //var sectionID:String!/**< 栏目ID */
    //var sectionName:String!/**< 栏目名称 */
    
    let type = Property<NSNumber>(key: "type")/**< 类型 */
    let storyID = Property<NSNumber>(key: "id")/**< 文章ID */
    var css = PropertyArray<String>(key: "css")/**< CSS */
    
}
