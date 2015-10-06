//
//  MailboxViewController.swift
//  WeekThreeProjectMailbox
//
//  Created by Prisca Ekkens on 10/3/15.
//  Copyright © 2015 Prisca Ekkens. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var iconScreenView: UIImageView!
    @IBOutlet var iconScreenTapGesture: UITapGestureRecognizer!
    @IBOutlet weak var listView: UIView!
    
    //MARK: Variables
    
    var messageViewOriginalCenter: CGPoint!
    var originalPosition: CGFloat!
    
    var savePosition:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageViewOriginalCenter = messageView.center
        
        feedScrollView.delegate = self
        feedScrollView.contentSize = CGSize(width: 320, height: 1200)
        
        iconScreenView.alpha = 0
        
        print(messageViewOriginalCenter)
        
    }
    
    //MARK: Actions
    
    @IBAction func onMessageViewPanGesture(sender: UIPanGestureRecognizer) {
        
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        var laterPosition: CGFloat!
        let deletePosition: CGFloat!
        let offPosition: CGFloat!
        
        laterPosition = 100
        offPosition = -300
        
        if sender.state == UIGestureRecognizerState.Began {
            messageViewOriginalCenter.x = messageView.center.x
            
            
            
            print("Gesture began")
            
        }
            
        else if sender.state == UIGestureRecognizerState.Changed {
            messageView.center.x = CGFloat(messageViewOriginalCenter.x + translation.x)
            
            print (translation.x)
            print("Gesture changed")
            
        }
            
        else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended")
            
            if location.x > -5 {
                self.listView.backgroundColor = UIColor.isYellowColor()
                self.messageView.center.x = laterPosition
            }
        
            else if location.x > laterPosition {
            self.listView.backgroundColor = UIColor.isBrownColor()
            self.messageView.center.x = offPosition
            
            iconScreenView.alpha = 1
                
            }
        }
    }
}

