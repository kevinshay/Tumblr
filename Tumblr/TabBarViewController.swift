//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Kevin Shay on 3/3/15.
//  Copyright (c) 2015 Brigade. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var isPresenting: Bool = true

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var searchContentView: UIView!
    @IBOutlet weak var accountContentView: UIView!
    @IBOutlet weak var trendingContentView: UIView!
    
    @IBOutlet weak var homeTabButton: UIButton!
    @IBOutlet weak var searchTabButton: UIButton!
    @IBOutlet weak var composeTabButton: UIButton!
    @IBOutlet weak var accountTabButton: UIButton!
    @IBOutlet weak var trendingTabButton: UIButton!
    
    @IBOutlet weak var explorePopup: UIImageView!
    
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var composeViewController: ComposeViewController!
    var accountViewController: AccountViewController!
    var trendingViewController: TrendingViewController!
    var currentViewController: UIViewController!
    
    var animateDuration: NSTimeInterval!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeStory") as HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchStory") as SearchViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("composeStory") as ComposeViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountStory") as AccountViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingStory") as TrendingViewController
        
        currentViewController = homeViewController
        DidTapTabButton(homeTabButton)
        
        animateDuration = 0.4
        
    
        // Do any additional setup after loading the view.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }

    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return animateDuration
    }
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(animateDuration, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
            
        } else {
            // Ask about this line below: what is destinationVC? What is fromViewController?
            var destinationVC = fromViewController as ComposeViewController
            
            UIView.animateWithDuration(self.animateDuration, delay:2, options: nil, animations: { () -> Void in
                
                }, completion: nil)

            UIView.animateWithDuration(self.animateDuration, delay: 0.1, options: nil, animations: { () -> Void in
                destinationVC.photoIconImage.transform = CGAffineTransformMakeTranslation(0, -500)
                }, completion: nil)
            
            UIView.animateWithDuration(self.animateDuration, delay: 0.2, options: nil, animations: { () -> Void in
                destinationVC.textIconImage.transform = CGAffineTransformMakeTranslation(0, -500)
                }, completion: nil)
            
            UIView.animateWithDuration(self.animateDuration, delay: 0.3, options: nil, animations: { () -> Void in
                destinationVC.quoteIconImage.transform = CGAffineTransformMakeTranslation(0, -500)
                }, completion: nil)
            
            UIView.animateWithDuration(self.animateDuration, delay: 0.35, options: nil, animations: { () -> Void in
                destinationVC.linkIconImage.transform = CGAffineTransformMakeTranslation(0, -500)
                }, completion: nil)
            
            UIView.animateWithDuration(self.animateDuration, delay: 0.4, options: nil, animations: { () -> Void in
                destinationVC.chatIconImage.transform = CGAffineTransformMakeTranslation(0, -500)
                }, completion: nil)
            
            UIView.animateWithDuration(self.animateDuration, delay: 0.4, options: nil, animations: { () -> Void in
                destinationVC.videoIconImage.transform = CGAffineTransformMakeTranslation(0, -500)
                
                }, completion: nil)
            UIView.animateWithDuration(animateDuration, delay: 0.5, options: nil, animations: { () -> Void in
                fromViewController.view.alpha = 0
            }, completion: { (complete) -> Void in
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            })
            
            }
        
    }



    
    @IBAction func DidTapTabButton(sender: AnyObject) {
        if (sender as NSObject == homeTabButton ) {
            removeChildView(currentViewController)
            addChildViewController(homeViewController)
            var homeView = homeViewController.view
            homeView.frame = contentView.frame
            contentView.addSubview(homeView)
            homeViewController.didMoveToParentViewController(self)
            currentViewController = homeViewController
            self.explorePopup.hidden = false
        
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.explorePopup.transform = CGAffineTransformMakeTranslation(0, 5)
            })
            
            UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
                self.explorePopup.transform = CGAffineTransformMakeTranslation(0, -10)
            }, completion: nil)
            
        }
        else if (sender as NSObject == searchTabButton) {
            removeChildView(currentViewController)
            addChildViewController(searchViewController)
            var searchView = searchViewController.view
            searchView.frame = contentView.frame
            searchContentView.addSubview(searchView)
            searchViewController.didMoveToParentViewController(self)
            currentViewController = searchViewController
            explorePopup.hidden = true
        }
            
        else if (sender as NSObject == composeTabButton) {
//            removeChildView(currentViewController)
            addChildViewController(composeViewController)
            var composeView = composeViewController.view
            composeView.frame = contentView.frame
            performSegueWithIdentifier("composeSegue", sender: self)
            composeViewController.didMoveToParentViewController(self)
//            currentViewController = composeViewController
            explorePopup.hidden = false

        }
            
        else if (sender as NSObject == accountTabButton) {
            removeChildView(currentViewController)
            addChildViewController(accountViewController)
            var accountView = accountViewController.view
            accountView.frame = contentView.frame
            accountContentView.addSubview(accountView)
            accountViewController.didMoveToParentViewController(self)
            currentViewController = accountViewController
            explorePopup.hidden = false

        }
        else if (sender as NSObject == trendingTabButton) {
            removeChildView(currentViewController)
            addChildViewController(trendingViewController)
            var trendingView = trendingViewController.view
            trendingView.frame = contentView.frame
            trendingContentView.addSubview(trendingView)
            trendingViewController.didMoveToParentViewController(self)
            currentViewController = trendingViewController
            explorePopup.hidden = false

            
        }
    }
    
    func removeChildView(content:UIViewController) {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
}