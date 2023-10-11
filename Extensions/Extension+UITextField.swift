//
//  Extension+UITextField.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 11/10/23.
//

import UIKit

extension UITextField {
    
    
    func applyBorder() {
        layer.borderWidth = 1
           layer.borderColor = UIColor(named: "blackDarkLight")?.cgColor
           layer.cornerRadius = 5
    }
    
    func setPlaceHolder(_ placeholder: String){
        
        self.placeholder = placeholder
        
    }
    
}
