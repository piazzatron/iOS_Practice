//
//  ViewController.swift
//  testApplication
//
//  Created by Michael Piazza on 6/27/15.
//  Copyright (c) 2015 QuickSorta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enteredText: UITextView!
    
    @IBAction func reverseText(sender: UIButton) {
        println("user text says \(enteredText)")
        
    }
    
}

