//
//  ViewController.swift
//  practise
//
//  Created by Umesh Chauhan on 03/11/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var lblDate: UILabel!
    @objc var configurationManager : ConfigurationManager!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationManager =  ConfigurationManager(withConfiguration: Configuration())
        // Do any additional setup after loading the view, typically from a nib.
        addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt), options: [.old,.new], context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        
        configurationManager.updateConfiguration()
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(configurationManager.configuration.updatedAt) {
            // Update Time Label
            lblDate.text = configurationManager.updatedAt
        }
    }
}

