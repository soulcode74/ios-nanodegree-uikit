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
    
    @IBOutlet var imageDetail: UIImageView!
    @IBOutlet var labelDetail: UILabel!
    
    
    
    override func viewWillAppear(animated: Bool) {
        self.viewWillAppear(true)
        
        self.imageDetail.image = UIImage(named: self.villain.imageName)
        self.labelDetail.text = self.villain.name

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
