//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Kevin Shay on 3/3/15.
//  Copyright (c) 2015 Brigade. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var searchFeedImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchFeedImage.alpha = 0
        var images = UIImage.animatedImageNamed("loading-", duration: 0.7)
        loadingImage.image = images

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5, delay: 0.8, options: nil, animations: { () -> Void in
                self.searchFeedImage.alpha = 1
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

   
}
