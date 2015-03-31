//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Andrea Perazzi on 30/03/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit

class VillainDetailViewController: UIViewController {
    
    
    var villain:Villain!
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var faceImage: UIImageView!
    
    override func viewWillAppear(animated: Bool) {

        self.nameLabel.text = self.villain.name
        var theimage = UIImage(named: self.villain.imageName)
        self.faceImage.image = theimage

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
