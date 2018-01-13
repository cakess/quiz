//
//  ViewController.swift
//  Quiz
//
//  Created by UCode on 12/30/17.
//  Copyright © 2017 Jacob Luvisi. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet var scoreLabel:UILabel!
    
    var score:Int = 0
    var total:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(score)/\(total)"
        scoreLabel.sizeToFit();
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


