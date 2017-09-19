//
//  BButton.swift
//  budfox
//
//  Created by Vladimir Psyukalov on 18.09.17.
//  Copyright © 2017 YOUROCK INC. All rights reserved.
//


import UIKit


class BButton: UIButton {
    
    @IBInspectable public var defaultColor: UIColor = UIColor.white
    @IBInspectable public var disableColor: UIColor = UIColor.lightGray
    
    override public var isEnabled: Bool {
        
        didSet {
            
            self.backgroundColor = isEnabled ? defaultColor : disableColor
            
        }
        
    }
    
}
