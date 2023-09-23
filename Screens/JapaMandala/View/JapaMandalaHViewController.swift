//
//  JapaMandalaHViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 04/08/23.
//

import UIKit

class JapaMandalaHViewController: UIViewController{
    
    @IBOutlet weak var twentyOne: UIButton!
    
    @IBOutlet weak var oneHEight: UIButton!
    
    @IBOutlet weak var history: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    
    //UI Updates
    
    func updateUI(){
        navBackBtn(Constants.japaMandala)
        twentyOne.updateShadow()
        oneHEight.updateShadow()
        history.underlineText("History")
    }
    
    
    
    @IBAction func actionBtns(_ sender: UIButton) {
        
        print(sender.titleLabel?.text ?? "")
        switch sender.titleLabel?.text {
            
          case Constants.twentyOne, Constants.oneHEight:
               pushViewcontroller(Constants.mantraDetailsVC)
          case Constants.history:
               pushViewcontroller(Constants.historyVC)
          default:
            print("No Case")
        }
        
        
    }
    
    
    

}
