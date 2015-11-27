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
        setupView()
    }
    
    func setupView() {
        if let configuration = loadConfiguration() {
            let backgroundColor = UIColor(hex: configuration["background"].stringValue)
            view.backgroundColor = backgroundColor
            
            let textColor = UIColor(hex: configuration["text"].stringValue)
            nameLabel.textColor = textColor
            subtitleLabel.textColor = textColor
            textView.textColor = textColor
            
            let name = configuration["name"].stringValue
            nameLabel.text = name
        }
    }

    func loadConfiguration(name resourceName: String? = "configuration", bundle: NSBundle = NSBundle.mainBundle()) -> JSON? {
        if let path = bundle.pathForResource(resourceName, ofType: "json") {
            if let data = NSData.init(contentsOfFile: path) {
                return JSON(data: data)
            }
            else {
                print("Error: Couldn't read configuration file")
            }
        }
        else {
            print("Error: Configuration file not found")
        }
        return nil
    }
}

