//
//  MailboxViewController.swift
//  WeekThreeProjectMailbox
//
//  Created by Prisca Ekkens on 10/3/15.
//  Copyright © 2015 Prisca Ekkens. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    //MARK: Outlets
    
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var iconScreenView: UIImageView!
    @IBOutlet weak var iconScreenTapGesture: UITapGestureRecognizer!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var actionView: UIView!
    @IBOutlet weak var menuView: UIImageView!
    @IBOutlet weak var mailboxScreenView: UIView!
    
    
    //MARK: Variables
    
    var messageViewOrigin: CGFloat!
    var mailboxScreenViewOrigin: CGFloat!
    
    
    //MARK: First Screen Visible
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedScrollView.delegate = self
        feedScrollView.contentSize = CGSize(width: 320, height: 1180)
        iconScreenView.alpha = 0
        
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        edgeGesture.edges = UIRectEdge.Left
        mailboxScreenView.addGestureRecognizer(edgeGesture)
        
    }
    
    //MARK: Actions
    
    @IBAction func onMessageViewPanGesture(sender: UIScreenEdgePanGestureRecognizer) {
        
        let location = sender.locationInView(view)
        //let translation = sender.translationInView(view)
        let laterPosition: CGFloat!
        let velocity = sender.velocityInView(view)
        
        laterPosition = -60
        
        if sender.state == UIGestureRecognizerState.Began {
            
            print("Gesture began")
            print(messageView.frame.origin.x)
            
            if velocity.x < -60 {
                self.listView.backgroundColor = UIColor.isYellowColor()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.messageView.frame.origin.x = laterPosition
                })
                
            } else if velocity.x > -60 {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.messageView.frame.origin.x = 0
                })
                
            } else if messageView.frame.origin.x < -70 {
                self.listView.backgroundColor = UIColor.isBrownColor()
                UIView.animateWithDuration(1.3, animations: { () -> Void in
                    self.messageView.frame.origin.x = laterPosition - 200
                    self.iconScreenView.alpha = 1
                })
            }
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            //print (translation.x)
            print("Gesture changed")
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            print("Gesture ended")
            print(messageView.frame.origin.x)
            
            //            if velocity.x > 220 {
            //                self.listView.backgroundColor = UIColor.isBrownColor()
            //
            //                UIView.animateWithDuration(1.3, animations: { () -> Void in
            //                    self.messageView.frame.origin.x = laterPosition - 200
            //                    self.iconScreenView.alpha = 1 })
            
            //            }
        }
    }
    
    //Dismiss Icon Screen with tap gesture
    
    @IBAction func onIconScreenViewTapGesture(sender: UIPanGestureRecognizer) {
        self.iconScreenView.userInteractionEnabled = true
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: Selector("dismissImageView:"))
        self.iconScreenView.addGestureRecognizer(gestureRecogniser)
    }
    
    func dismissImageView(gestureRecognizer: UITapGestureRecognizer) {
        self.iconScreenView.removeFromSuperview()
        self.messageView.frame.origin.x = 0
    }
    
    //Reveal Menu with screePanGesture
    
    @IBAction func onMenuScreenPanGesture(sender: UIScreenEdgePanGestureRecognizer) {
        
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            mailboxScreenViewOrigin = mailboxScreenView.frame.origin.x
            
            print("Gesture2 began")
        }
        
        if sender.state == UIGestureRecognizerState.Changed {
            mailboxScreenView.frame.origin.x = mailboxScreenView.frame.origin.x + translation.x
            print("Gesture2 changed")
        }
            
        else if sender.state == UIGestureRecognizerState.Ended {
            if location.x > 150 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.mailboxScreenView.frame.origin.x = 280
                })
                print("Gesture2 ended")
                
            }
        }
    }
}


