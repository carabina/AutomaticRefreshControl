//
//  AutomaticRefreshControl.swift
//  AutomaticRefreshControl
//
//  Created by Jeffrey Fulton on 2016-09-09.
//  Copyright © 2016 Jeffrey Fulton. All rights reserved.
//

import UIKit

public class AutomaticRefreshControl: UIRefreshControl {
    
    //MARK: - Properties
    
    private var forceTintChangeRequired = true
    
    private var parentScrollView: UIScrollView? {
        return self.superview as? UIScrollView
    }
    
    //MARK: - Overrides
    
    public override func endRefreshing() {
        // TODO: Determine if this is necessary at all.
        delay(inSeconds: 0) {
            super.endRefreshing()
        }
    }
    
    public override func beginRefreshing() {
        guard refreshing == false else { return }
        guard let parentScrollView = parentScrollView else { return }
        
        forceTintChangeToTakeAffectIfNeeded {
            super.beginRefreshing()
            
            let contentOffset = CGPoint(x: parentScrollView.contentOffset.x, y: parentScrollView.contentOffset.y - self.frame.size.height)
            parentScrollView.setContentOffset(contentOffset, animated: true)
        }
    }
    
    //MARK: - Helpers
    
    private func forceTintChangeToTakeAffectIfNeeded(closure: () -> Void) {
        guard forceTintChangeRequired else {
            closure()
            return
        }
        
        guard let parentScrollView = parentScrollView else { return }
        
        delay(inSeconds: 0) {
            super.beginRefreshing()
            let originalContentOffset = parentScrollView.contentOffset
            let tempContentOffset = CGPoint(x: originalContentOffset.x, y: originalContentOffset.y - 1)
            parentScrollView.setContentOffset(tempContentOffset, animated: false)
            
            delay(inSeconds: 0) {
                super.endRefreshing()
                parentScrollView.setContentOffset(originalContentOffset, animated: false)
                
                self.forceTintChangeRequired = false
                
                delay(inSeconds: 0.01) {
                    closure()
                }
            }
        }
    }
}

/// Execute the supplied closure on the main queue
/// after the specified number of seconds.
/// To be replaced by Swift 3.0 easier syntax; this helper will no longer be useful.
private func delay(inSeconds delay: Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(),
        closure
    )
}