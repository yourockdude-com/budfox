//
//  FALTextFieldMask.swift
//
//  Created by Matheus Falcão on 06/09/16.
//

import UIKit

class FALTextFieldMask : NSObject, UITextFieldDelegate {
    
    private static var sharedInstance : FALTextFieldMask!
    
    /* **************************************************************************************************
     **
     **  MARK: get Instance
     **
     ****************************************************************************************************/
    
    static func getInstance() -> FALTextFieldMask {
        
        if sharedInstance == nil {
            sharedInstance = FALTextFieldMask()
        }
        
        return sharedInstance
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Text Field Delegate
     **
     ****************************************************************************************************/
    
    @objc func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.characters.count == 0 {
            return true
        }
        
        var num = textField.text?.characters.count
        
        if num != nil {
            
            if num! >= textField.textMask.characters.count {
                return false
            }
            
            var charAtIndex = textField.textMask[textField.textMask.index(textField.textMask.startIndex, offsetBy: num!)]
            
            while( charAtIndex != "N" && charAtIndex != "F" && charAtIndex != "S" ) {
                
                textField.text = textField.text!.appending("\(charAtIndex)")
                
                num = num! + 1
                
                charAtIndex = textField.textMask[textField.textMask.index(textField.textMask.startIndex, offsetBy: num!)]
                
            }
            
            switch charAtIndex {
                
            case "N":
                let invalidCharacters =  CharacterSet.init(charactersIn: "0123456789").inverted
                
                return string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
                
            case "F":
                let invalidCharacters = CharacterSet.init(charactersIn: "0123456789.,").inverted
                
                return string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
                
            case "S":
                return true
                
            default:
                return false
                
            }
            
            
        }
    
        return false
        
    }
    
}
