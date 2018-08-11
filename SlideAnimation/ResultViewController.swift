//
//  ResultViewController.swift
//  SlideAnimation
//
//  Created by Lurf on 2018/08/11.
//  Copyright © 2018 Lurf. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UIViewControllerTransitioningDelegate {

    let animator = Animator()
    
    class func instantiate() -> ResultViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Result") as! ResultViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitioningDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.presenting = false
        return animator
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.presenting = true
        return animator
    }
}
