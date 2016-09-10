//
//  ViewController.swift
//  AutomaticRefreshControl
//
//  Created by Jeffrey Fulton on 09/09/2016.
//  Copyright (c) 2016 Jeffrey Fulton. All rights reserved.
//

import UIKit
import AutomaticRefreshControl

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet var tableView: UITableView!
    var automaticRefreshControl = AutomaticRefreshControl()
    var timer: NSTimer?

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add AutomaticRefreshControl to tableView.
        tableView.insertSubview(automaticRefreshControl, atIndex: 0)
        
        // Change AutomaticRefreshControl's tintColor property.
        automaticRefreshControl.tintColor = .redColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Start timer to repeatedly show/hide AutomaticRefreshControl
        timer = NSTimer.scheduledTimerWithTimeInterval(
            4.0,
            target: self,
            selector: #selector(performAsynchronousTasks),
            userInfo: nil,
            repeats: true
        )
        timer?.fire()
    }
    
    // MARK: Helpers
    
    @objc private func performAsynchronousTasks() {
        // Programmatically show AutomaticRefreshControl.
        automaticRefreshControl.beginRefreshing()
        
        // Perform asynchronous task(s).
        delay(inSeconds: 2) {
            
            // Programmatically hide AutomaticRefreshControl.
            self.automaticRefreshControl.endRefreshing()
        }
    }
}

/// Execute the supplied closure on the main queue
/// after the specified number of seconds.
func delay(inSeconds delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(),
        closure
    )
}
