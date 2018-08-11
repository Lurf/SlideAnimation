//
//  Animator.swift
//  SlideAnimation
//
//  Created by Lurf on 2018/08/11.
//  Copyright © 2018 Lurf. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let movedDistance: CGFloat = 70.0
    var presenting = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) else {
                return
        }
        
        if presenting {
            presentTransition(transitionContext: transitionContext, toView: toVC.view, fromView: fromVC.view)
        } else {
            dismissTransition(transitionContext: transitionContext, toView: toVC.view, fromView: fromVC.view)
        }
        
    }
    
    private func presentTransition(transitionContext: UIViewControllerContextTransitioning, toView: UIView, fromView: UIView) {
        let containerView = transitionContext.containerView
        containerView.insertSubview(toView, aboveSubview: fromView)
        
        let rect = CGRect(origin: toView.frame.origin, size: toView.frame.size)
        toView.frame = rect.offsetBy(dx: containerView.frame.size.width, dy: 0.0)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, options: .curveEaseInOut, animations: {
            let rect = CGRect(origin: fromView.frame.origin, size: fromView.frame.size)
            fromView.frame = rect.offsetBy(dx: -self.movedDistance, dy: 0.0)
            fromView.alpha = 0.7
            
            toView.frame = containerView.frame
        }) { _ in
            let rect = CGRect(origin: fromView.frame.origin, size: fromView.frame.size)
            fromView.frame = rect.offsetBy(dx: self.movedDistance, dy: 0.0)
            
            transitionContext.completeTransition(true)
        }
    }

    private func dismissTransition(transitionContext: UIViewControllerContextTransitioning, toView: UIView, fromView: UIView) {
        let containerView = transitionContext.containerView
        containerView.insertSubview(toView, belowSubview: fromView)
        
        let rect = CGRect(origin: toView.frame.origin, size: toView.frame.size)
        toView.frame = rect.offsetBy(dx: -self.movedDistance, dy: 0.0)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.05, options: .curveEaseInOut, animations: {
            let fromViewRect = CGRect(origin: fromView.frame.origin, size: fromView.frame.size)
            fromView.frame = fromViewRect.offsetBy(dx: containerView.frame.size.width, dy: 0.0)
            
            let toViewRect = CGRect(origin: toView.frame.origin, size: toView.frame.size)
            toView.frame = toViewRect.offsetBy(dx: self.movedDistance, dy: 0.0)
            toView.alpha = 1.0
        }) { _ in
            transitionContext.completeTransition(true)
        }
    }
}
