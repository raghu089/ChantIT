//
//  Extension+UIViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 08/09/23.
//

import Foundation
import UIKit


extension UIViewController{
    
    func popAlert(title: String, message: String, actionTitles: [String], actionStyle: [UIAlertAction.Style],  action: [((UIAlertAction) -> Void)]){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for (index,title) in actionTitles.enumerated(){
            
            let action = UIAlertAction.init(title: title, style: actionStyle[index], handler: action[index])
            alert.addAction(action)
            
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func hideKeyboardWhenTappedAround(){
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    
    @objc func dismissKeyboard(){
        
        view.endEditing(true)
        
    }
    
    
}