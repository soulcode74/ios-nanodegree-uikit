//
//  StoryNodeViewController.swift
//  MYOA
//
//  Created by Jarrod Parkes on 11/2/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class StoryNodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var storyNode: StoryNode!
    
    @IBOutlet weak var adventureImageView: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var restartButton: UIButton!
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the image
        if let imageName = storyNode.imageName? {
            self.adventureImageView.image = UIImage(named: imageName)
        }
        
        // Set the message text
        self.messageTextView.text = storyNode.message
        
        // Hide the restart button if there are choices to be made
        restartButton.hidden = storyNode.promptCount() > 0
    }
    
        // MARK: - Table - Place Implementation
    
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
            let selectedNode = storyNode.storyNodeForIndex(indexPath.row)
            
            let nodeController = self.storyboard?.instantiateViewControllerWithIdentifier("StoryNodeViewController") as StoryNodeViewController
            
            nodeController.storyNode = selectedNode
            
            self.navigationController?.pushViewController(nodeController, animated: true)
        }
    
        // MARK: - Table - Data Source
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return storyNode.promptCount()
        }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
    
            cell.textLabel!.text = storyNode.promptForIndex(indexPath.row)
            
            return cell
        }

    
    // MARK: - Actions
    
    @IBAction func restartStory() {
        let controller = self.navigationController!.viewControllers[1] as UIViewController
        self.navigationController?.popToViewController(controller, animated: true)
    }
    
}