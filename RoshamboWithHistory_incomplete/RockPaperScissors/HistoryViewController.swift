//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Andrea Perazzi on 24/03/15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource {
    
    var history = [RPSMatch]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Mark: Table View Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return UITableViewCell()
        
    }
    
    // Dismiss view controller
    @IBAction func dismisView(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
