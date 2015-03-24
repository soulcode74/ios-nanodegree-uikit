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
    
    
    // Dismiss view controller
    @IBAction func dismisView(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
