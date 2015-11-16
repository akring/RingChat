//
//  MessageVC.swift
//  RingChat
//
//  Created by 吕俊 on 15/11/16.
//  Copyright © 2015年 Akring. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class MessageVC: JSQMessagesViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        inputToolbar?.contentView?.leftBarButtonItem = nil
        automaticallyScrollsToMostRecentMessage = true
        
        senderId = "Akring"
        senderDisplayName = "Akring"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView?.collectionViewLayout.springinessEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // ACTIONS
    
    func receivedMessagePressed(sender: UIBarButtonItem) {
        // Simulate reciving message
        showTypingIndicator = !showTypingIndicator
        scrollToBottomAnimated(true)
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        
        //sendMessage(text, sender: sender)
        
        finishSendingMessage()
    }
    
    override func didPressAccessoryButton(sender: UIButton!) {
        print("Camera pressed!", terminator: "")
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        
        let data = JSQMessage(senderId: "Akring", displayName: "Akring", text: "This is a test text")
        
        return data
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        let factory = JSQMessagesBubbleImageFactory()
        let outData = factory.outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
        //let inData = factory.incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleGreenColor())
        
        return outData
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        
        let avator = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(), diameter: UInt(kJSQMessagesCollectionViewAvatarSizeDefault))
        
        return avator
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        
        cell.textView!.textColor = UIColor.whiteColor()
        
        let attributes : [String:AnyObject] = [NSForegroundColorAttributeName:cell.textView!.textColor!, NSUnderlineStyleAttributeName: 1]
        cell.textView!.linkTextAttributes = attributes
        
        //        cell.textView.linkTextAttributes = [NSForegroundColorAttributeName: cell.textView.textColor,
        //            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle]
        return cell
    }
    
    
    // View  usernames above bubbles
    override func collectionView(collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> NSAttributedString! {
//        let message = messages[indexPath.item];
//        
//        // Sent by me, skip
//        if message.sender() == sender {
//            return nil;
//        }
//        
//        // Same as previous sender, skip
//        if indexPath.item > 0 {
//            let previousMessage = messages[indexPath.item - 1];
//            if previousMessage.sender() == message.sender() {
//                return nil;
//            }
//        }
        
        return NSAttributedString(string:"akring")
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
//        let message = messages[indexPath.item]
//        
//        // Sent by me, skip
//        if message.sender() == sender {
//            return CGFloat(0.0);
//        }
//        
//        // Same as previous sender, skip
//        if indexPath.item > 0 {
//            let previousMessage = messages[indexPath.item - 1];
//            if previousMessage.sender() == message.sender() {
//                return CGFloat(0.0);
//            }
//        }
        
        return kJSQMessagesCollectionViewCellLabelHeightDefault
    }

}
