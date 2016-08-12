//
//  ViewController.swift
//  Telegraph
//
//  Created by James O'Connor on 8/7/16.
//  Copyright © 2016 James O'Connor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, telegraphKeyDelegate {

    @IBOutlet weak var messageBody :UITextView!
    @IBOutlet weak var telegraphKey :telegraphKeyView!
    
    
    var keyValue :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        telegraphKey.delegate = self
        
    }
    
    func keyPressed(keyValue :String) {
        
        print(keyValue)
        
        let messageContent :String = self.messageBody.text!
        
        self.messageBody.text = messageContent + keyValue
        
        print(self.messageBody.text)
    }
    
    @IBAction func clearButtonPressed() {
        
        self.messageBody.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

