//
//
//  MantraAddingViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 07/08/23.
//

import UIKit

class MantraAddingViewController: UIViewController {
    
    @IBOutlet weak var mantraTextField: UITextField!
    
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var skipBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    //UI Updates
    
    func updateUI(){
        navBackBtn(Constants.japaMandala)
        continueBtn.updateShadow()
        skipBtn.underlineText("Skip")
        mantraTextField.applyBorder()
        mantraTextField.setPlaceHolder("Enter Mantra")
    }
    
    //Actions
    
    @IBAction func actionBtns(_ sender: UIButton) {
        
        print(sender.titleLabel?.text ?? "")
        switch sender.titleLabel?.text {
            
          case Constants.continueBtn:
               pushViewcontroller(Constants.JMHomeVC)
          case Constants.skipBtn:
               pushViewcontroller(Constants.JMHomeVC)
          default:
            print("No Case")
        }
        
        
    }
    
    
}
