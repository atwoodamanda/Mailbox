//
//  FeedViewController.swift
//  Mailbox
//
//  Created by Amanda Atwood on 10/24/14.
//  Copyright (c) 2014 Amanda Atwood. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
   
    @IBOutlet weak var feed: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var rescheduleImage: UIImageView!
    @IBOutlet weak var deleteImage: UIImageView!
    @IBOutlet weak var viewView: UIView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var listImage: UIImageView!
    
    var imageCenter: CGPoint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 1432)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onMessagePan(sender: UIPanGestureRecognizer) {
        var translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            imageCenter = viewView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            viewView.center.x = imageCenter.x + translation.x
            if viewView.center.x > 160 && viewView.center.x <= 319 {
                self.view.backgroundColor = UIColor.greenColor()
                self.leftImage.alpha = 1
                self.deleteImage.alpha = 0
                
            } else if viewView.center.x >= 320 {
                self.view.backgroundColor = UIColor.redColor()
                self.leftImage.alpha = 0
                self.deleteImage.alpha = 1
                
            } else if viewView.center.x < 160 && viewView.center.x > 0 {
                self.view.backgroundColor = UIColor.yellowColor()
                self.rightImage.alpha = 1
                self.listImage.alpha = 0
            } else {
                self.view.backgroundColor = UIColor.brownColor()
                self.rightImage.alpha = 0
                self.listImage.alpha = 1
            }
        
            
        }
        
        else if sender.state == UIGestureRecognizerState.Ended {
            if viewView.center.x < 160 && viewView.center.x > 0 {
                viewView.center.x = -160
                self.rescheduleImage.alpha = 1
                self.button.alpha = 1
            }
            
            
        }
        
      
       
    }

    
    @IBAction func onButton(sender: AnyObject) {
        self.rescheduleImage.alpha = 0
        self.button.alpha = 0
        feed.transform = CGAffineTransformMakeTranslation(0, -88)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
