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
    
    
    // Table View Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCellWithIdentifier("historyCell") as HistoryTableViewCell
        var match = self.history[indexPath.row]
        
        cell.titleLabel.text = self.resultString(match)
        cell.p1Figure.image = self.imageForMatch(match.p1)
        cell.p2Figure.image = self.imageForMatch(match.p2)
        cell.backgroundColor = self.cellBgColor(match)

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
    
    
    // Image gesture
    func imageForMatch(gesture: RPS) -> UIImage {
        
        var name = ""
        
        switch (gesture) {
        case .Rock:
            name = "rock"
        case .Paper:
            name = "paper"
        case .Scissors:
            name = "scissors"
        }
        
        return UIImage(named: name)!
    }
    
    
    func cellBgColor(match: RPSMatch) -> UIColor {
        if match.p1.defeats(match.p2) {
            return UIColor(red:0.8, green:0.933, blue:0.741, alpha:1)
        } else if match.p2.defeats(match.p1) {
            return UIColor(red:1, green:0.854, blue:0.87, alpha:1)
        } else {
            return UIColor.whiteColor()
        }
    }
    
    
    
    // Dismiss view controller
    @IBAction func dismisView(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
