//
//  ViewController.swift
//  NightsWatch
//
//  Created by Bas Pellis on 26/11/15.
//  Copyright © 2015 WebComrades. All rights reserved.
//

import UIKit
import SwiftyJSON
import Hex

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadConfiguration();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadConfiguration() {
        if let path = NSBundle.mainBundle().pathForResource("configuration", ofType: "json") {
            if let data = NSData.init(contentsOfFile: path) {
                let config = JSON(data: data);
                let backgroundColor = UIColor(hex: config["background"].stringValue);
                view.backgroundColor = backgroundColor;
                
                let textColor = UIColor(hex: config["text"].stringValue)
                nameLabel.textColor = textColor;
                subtitleLabel.textColor = textColor;
                textView.textColor = textColor;
                
                let name = config["name"].stringValue;
                nameLabel.text = name;
            }
            else {
                print("Error: Couldn't read configuration file");
            }
        }
        else {
            print("Error: Configuration file not found");
        }
    }
}

