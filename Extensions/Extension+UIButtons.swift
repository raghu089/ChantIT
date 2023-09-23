//
//  Extension+UIButtons.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 15/09/23.
//

import UIKit


extension UIButton {
    
    func applyBorderProperties() {
           layer.borderWidth = 3.0
           layer.borderColor = UIColor(named: "blackDarkLight")?.cgColor
    }
    
    func updateShadow() {
           self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
           self.layer.shadowOffset = CGSize(width: 0, height: 3)
           self.layer.shadowOpacity = 1.0
           self.layer.shadowRadius = 10.0
           self.layer.masksToBounds = false
    }
    
    func underlineText(_ title: String){
        
        let yourAttributes: [NSAttributedString.Key: Any] = [
             .font: UIFont.systemFont(ofSize: 16, weight: .semibold),
             .foregroundColor: UIColor(named: "blackDarkLight") ?? "",
             .underlineStyle: NSUnderlineStyle.single.rawValue
         ]
        
        let attributeString = NSMutableAttributedString(
                string: title,
                attributes: yourAttributes
        )
        self.setAttributedTitle(attributeString, for: .normal)
        
    }

    
    
}
