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

        var cell = tableView.dequeueReusableCellWithIdentifier("historyCell") as UITableViewCell
        var match = self.history[indexPath.row]
        
        cell.textLabel?.text = self.resultString(match)
        cell.detailTextLabel?.text = "\(match.p1) vs \(match.p2)"
        
        return cell
    }
    
    
    // Result string function
    func resultString(match: RPSMatch) -> String {
        
        // Handle the tie
        if match.p1 == match.p2 {
            return "It's a tie!"
        } else {
            return match.p1.defeats(match.p2) ? "You Win!" : "You Lose!"
        }

    }
    
    
    // Dismiss view controller
    @IBAction func dismisView(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
