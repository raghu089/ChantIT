//
//  Extension+UIViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 08/09/23.
//

import Foundation
import UIKit
import AVFoundation


extension UIViewController {
    
    
    //MARK: - Alert View
    
    func popAlert(title: String, message: String, actionTitles: [String], actionStyle: [UIAlertAction.Style],  action: [((UIAlertAction) -> Void)]){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for (index,title) in actionTitles.enumerated(){
            
            let action = UIAlertAction.init(title: title, style: actionStyle[index], handler: action[index])
            alert.addAction(action)
            
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: Hide Keyboard
    func hideKeyboardWhenTappedAround(){
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    //MARK: Dismiss
    @objc func dismissKeyboard(){
        
        view.endEditing(true)
        
    }
    
    //MARK: - Navigation
    
    func pushViewcontroller(_ identifier: String){
        
      let VC = Constants.mainStoryboard.instantiateViewController(withIdentifier: identifier)
        
      self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    func presentViewcontroller(_ identifier: String){
       
        let VC = Constants.mainStoryboard.instantiateViewController(withIdentifier: identifier)
          
        self.present(VC, animated: true)
        
    }
    
    func pushDataVc(_ identifier: String) -> UIViewController{
        
        let Vc = Constants.mainStoryboard.instantiateViewController(withIdentifier: identifier)
     
        return Vc
        
    }
    
    
    //MARK: Navigation Left Button (Back)
   
    func navBackBtn(_ Navtitle: String) {
       
               self.navigationItem.title = Navtitle
        
               let backBtnImage = UIImage(named: "arrowL")
               
               let backButton = UIBarButtonItem(
                   image: backBtnImage,
                   style: .plain,
                   target: self,
                   action: #selector(openInfo)
               )

               self.navigationItem.leftBarButtonItem = backButton
        
    }
    
    @objc func openInfo() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: Navigation Right Button (Sound)
   
    func soundBtn(_ selector: Selector?){
       
        let soundBtnImage = UIImage(named: "soundOff")
        
        let soundButton = UIBarButtonItem(
            image: soundBtnImage,
            style: .plain,
            target: self,
            action: selector
        )
        
        
        self.navigationItem.rightBarButtonItem = soundButton
        
    }
 
    
}


extension Date {
    
    static func getCurrentDate() -> String {

            let dateFormatter = DateFormatter()

            dateFormatter.dateFormat = "dd/MM/yyyy"

            return dateFormatter.string(from: Date())

    }
    
}
