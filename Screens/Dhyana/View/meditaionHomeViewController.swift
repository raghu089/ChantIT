//
//  meditaionHomeViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 21/08/23.
//

import UIKit

class meditaionHomeViewController: PickerViewController {
    
    
    @IBOutlet weak var setBtn: UIButton!
    
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var historyBtn: UIButton!
    
   // let pickerView = PickerViewController()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    
    //UI Updates
    
    func updateUI(){
        continueBtn.applyBorderProperties()
        navBackBtn(Constants.dhyana)
        continueBtn.updateShadow()
        setBtn.updateShadow()
        historyBtn.underlineText("History")
       // pickerView.configure()
    }
    
    
    @IBAction func actionBtn(_ sender: UIButton) {
        
        print(sender.titleLabel?.text ?? "")
        switch sender.titleLabel?.text {
            
          case Constants.setBtn:
               print("Picker")
               openPicker()
          case Constants.continueBtn:
               let vc = pushDataVc(Constants.meditationTimerVC) as! MeditationTimerViewController
               vc.isTimeSet = false
               self.navigationController?.pushViewController(vc, animated: true)
          case Constants.history:
               let VC = pushDataVc(Constants.historyVC) as! HistoryViewController
               VC.isJapaMandal = false
               self.navigationController?.pushViewController(VC, animated: true)
          default:
            print("No Case")
        }
        
        
    }
    
  

}







