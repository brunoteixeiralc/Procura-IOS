//
//  BounceAnimationController.swift
//  procura
//
//  Created by Bruno Corrêa on 19/01/2018.
//  Copyright © 2018 Bruno Lemgruber. All rights reserved.
//

import UIKit


class BounceAnimationController: NSObject,UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext:UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    //keyframes de animação. Cada key frame tem uma ação.
    func animateTransition(using transitionContext:UIViewControllerContextTransitioning) {
        if let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
            let containerView = transitionContext.containerView
            toView.frame = transitionContext.finalFrame(for:toViewController)
            containerView.addSubview(toView)
            toView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            UIView.animateKeyframes(withDuration: transitionDuration(
                using: transitionContext), delay: 0, options:
                .calculationModeCubic, animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                       relativeDuration: 0.334, animations: {
                                        toView.transform = CGAffineTransform(scaleX: 1.2,
                                                                             y: 1.2)
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.334,
                                       relativeDuration: 0.333, animations: {
                                        toView.transform = CGAffineTransform(scaleX: 0.9,
                                                                             y: 0.9)
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.666,
                                       relativeDuration: 0.333, animations: {
                                        toView.transform = CGAffineTransform(scaleX: 1.0,
                                                                             y: 1.0)
                    })
            }, completion: { finished in
                transitionContext.completeTransition(finished)
            })
        }
    }
}
