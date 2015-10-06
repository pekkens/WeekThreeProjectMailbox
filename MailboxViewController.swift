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
        let laterPosition: CGFloat!
        let deletePosition: CGFloat!
        let offPosition: CGFloat!
        
        laterPosition = 90
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
            
            if messageViewOriginalCenter.x < -150 {
                self.listView.backgroundColor = UIColor.isBrownColor()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.messageView.center.x = offPosition
                    self.iconScreenView.alpha = 1 })
            
            } else if messageViewOriginalCenter.x < 100 {
                self.listView.backgroundColor = UIColor.isYellowColor()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.messageView.center.x = laterPosition
                })
            }
            

            }
        }
    }


