//
//  StoryModel.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/23.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit

enum DataType{
    
    case HTML,JS,CSS
}

class StoryModel: NSObject {

    /**< 主体内容 */
    var body:String!
    /**< 图片提供方 */
    var imageSource:String?
    /**< 图片地址 */
    var imageUrl:String!
    /**< 标题 */
    var title:String!
    /**< 分享地址 */
    var shareUrl:String!
    /**< JS */
    var jsSet:NSArray!
    /**< 分享者 */
    var recommenders:NSArray!
    /****************栏目块***************/
    var sectionThumbnail:String!/**< 栏目缩略图 */
    var sectionID:String!/**< 栏目ID */
    var sectionName:String!/**< 栏目名称 */
    
    var type:NSNumber!/**< 类型 */
    var storyID:String! /**< 文章ID */
    var css:NSArray! /**< CSS */
    
    /****************外站引用的特殊文章 type=1***************/
    var themeName:String!/**< 主题名称 */
    var themeID:String! /**< 主题ID */
    var editorName:String! /**< 编辑名称 */
    
    internal init(dic:NSDictionary) {
        super.init()
        if Utils.isValidDictionary(dic){
            
            title = dic.objectForKey("title") as! String
            imageSource = dic.objectForKey("image_source") as? String
            imageUrl = dic.objectForKey("image") as! String
            shareUrl = dic.objectForKey("share_url") as! String
            jsSet = dic.objectForKey("js") as? NSArray
            type = dic.objectForKey("type") as! NSNumber
            let tempID = dic.objectForKey("id") as! NSNumber
            storyID = tempID.description
            css = dic.objectForKey("css") as! NSArray
            body = dic.objectForKey("body") as! String
        }
        
//        if body != nil{
//            writeDataToDisk(.HTML, data: body, storyid: storyID, storyname: title)
//        }
    }
    
//    func writeDataToDisk(type:DataType,data:String,storyid:String,storyname:String){
//        
//        switch type {
//        case .HTML:
//            let path = Utils.getFilePath(storyid+storyname+".html")//取得文件路径
//            do{
//                try data.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
//            }
//            catch{
//                print("HTML保存失败")
//            }
//            
//        case .JS:
//            let path = Utils.getFilePath(storyid+storyname+".js")//取得文件路径
//            do{
//                try data.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
//            }
//            catch{
//                print("JS保存失败")
//            }
//        case .CSS:
//            let path = Utils.getFilePath(storyid+storyname+".css")//取得文件路径
//            do{
//                try data.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
//            }
//            catch{
//                print("CSS保存失败")
//            }
//        }
//    }
}
