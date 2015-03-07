//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Kevin Shay on 3/3/15.
//  Copyright (c) 2015 Brigade. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var textIconImage: UIImageView!
    @IBOutlet weak var photoIconImage: UIImageView!
    @IBOutlet weak var quoteIconImage: UIImageView!
    @IBOutlet weak var linkIconImage: UIImageView!
    @IBOutlet weak var chatIconImage: UIImageView!
    @IBOutlet weak var videoIconImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textIconImage.transform = CGAffineTransformMakeTranslation(0, 500)
        textIconImage.alpha = 0
        photoIconImage.transform = CGAffineTransformMakeTranslation(0, 500)
        photoIconImage.alpha = 0
        quoteIconImage.transform = CGAffineTransformMakeTranslation(0, 500)
        quoteIconImage.alpha = 0
        linkIconImage.transform = CGAffineTransformMakeTranslation(0, 500)
        linkIconImage.alpha = 0
        chatIconImage.transform = CGAffineTransformMakeTranslation(0, 500)
        chatIconImage.alpha = 0
        videoIconImage.transform = CGAffineTransformMakeTranslation(0, 500)
        videoIconImage.alpha = 0
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func viewWillAppear(animated: Bool) {
        println("View Will Appear")
    }

    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
            self.photoIconImage.transform = CGAffineTransformMakeTranslation(0, 0)
            self.photoIconImage.alpha = 1
            }, completion: nil )
       
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
            self.textIconImage.transform = CGAffineTransformMakeTranslation(0, 0)
            self.textIconImage.alpha = 1
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
            self.quoteIconImage.transform = CGAffineTransformMakeTranslation(0, 0)
            self.quoteIconImage.alpha = 1
            }, completion: nil )
        
        UIView.animateWithDuration(0.5, delay: 0.35, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
            self.linkIconImage.transform = CGAffineTransformMakeTranslation(0, 0)
            self.linkIconImage.alpha = 1
            }, completion: nil )
        
        UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
            self.chatIconImage.transform = CGAffineTransformMakeTranslation(0, 0)
            self.chatIconImage.alpha = 1
            }, completion: nil )
        
        UIView.animateWithDuration(0.5, delay: 0.4, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
            self.videoIconImage.transform = CGAffineTransformMakeTranslation(0, 0)
            self.videoIconImage.alpha = 1
            }, completion: nil )
        
      

        
    }
    
    override func viewWillDisappear(animated: Bool) {
        println("View Will disappear")
    }
    
  override func viewDidDisappear(animated: Bool) {
        println("View Did disappear")
    
    }
    
    @IBAction func didTapNeverMind(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
