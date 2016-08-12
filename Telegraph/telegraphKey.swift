//
//  telegraphKey.swift
//  Telegraph
//
//  Created by James O'Connor on 8/8/16.
//  Copyright © 2016 James O'Connor. All rights reserved.
//

import UIKit

protocol telegraphKeyDelegate :class {
    
    func keyPressed(keyValue :String)
    
}

class telegraphKeyView: UIButton {

    var timestampAtTouchesBegan :NSTimeInterval?
    var keyValue :String?
    weak var delegate :telegraphKeyDelegate?
    
    
    override func drawRect(rect: CGRect) {
        
        let path = UIBezierPath(ovalInRect: rect)
        UIColor.blueColor().setFill()
        path.fill()
        
        setTitle("Press Me", forState: .Normal)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.timestampAtTouchesBegan = touches.first!.timestamp
        
        print(timestampAtTouchesBegan)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let diff = event!.timestamp - self.timestampAtTouchesBegan!
        if (diff < 0.15) {
            
            keyValue = "•"
            
            print(keyValue)
            
        }
            
        else if (diff>0.15){
            
            keyValue = "-"
            print(keyValue)
            
        }
        
        self.delegate!.keyPressed(keyValue!)
    }

}


