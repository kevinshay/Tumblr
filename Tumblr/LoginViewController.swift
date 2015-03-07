//
//  LoginViewController.swift
//  Tumblr
//
//  Created by Kevin Shay on 3/5/15.
//  Copyright (c) 2015 Brigade. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginContainer: UIView!
    
    @IBOutlet weak var emailTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginContainer.alpha = 0
        loginContainer.transform = CGAffineTransformMakeScale(0.9, 0.9)
        emailTextFiled.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
            self.loginContainer.alpha = 1
            self.loginContainer.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
       
    }
    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cancelDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
