//
//  ViewController.swift
//  funFacts
//
//  Created by Michael Piazza on 6/27/15.
//  Copyright (c) 2015 QuickSorta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let facts = FunFacts()

    override func viewDidLoad() {
        super.viewDidLoad()
        funFactLabel.text = facts.factArray[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    Target action design pattern

    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var fetchFactButton: UIButton!
    
    @IBAction func showFact() {
        funFactLabel.text = facts.getRandomFact()
    }

}

