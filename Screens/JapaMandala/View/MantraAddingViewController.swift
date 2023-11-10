//
//
//  MantraAddingViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 07/08/23.
//

import UIKit

class MantraAddingViewController: dataPickerViewController {
    
    @IBOutlet weak var mantraTextField: UITextField!
    
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var skipBtn: UIButton!
    
    @IBOutlet weak var mantraSetsTextField: UITextField!
    
    var japaModel : japaMandalaModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mantraSetsTextField.delegate = self
        updateUI()
        
    }
    
    //UI Updates
    
    func updateUI(){
        navBackBtn(Constants.japaMandala)
        continueBtn.updateShadow()
        skipBtn.applyBorderProperties()
        mantraTextField.applyBorder()
        mantraTextField.setPlaceHolder("Enter Mantra")
        mantraSetsTextField.applyBorder()
        mantraSetsTextField.setPlaceHolder("Sets")
       
    }
    
    //Actions
    
    @IBAction func actionBtns(_ sender: UIButton) {
        
        print(sender.titleLabel?.text ?? "")
        
        let VC = pushDataVc(Constants.JMHomeVC) as! JMHomeViewController
        
        switch sender.titleLabel?.text {
            
        case Constants.continueBtn:
            
            let mantraText = mantraTextField.text ?? ""
            let numberOfSets = japaModel?.NumberOfSets ?? 0
            if mantraText == "" || numberOfSets == 0 {
                popAlert(title: "Alert!", message: "Please Enter All Details.", actionTitles: ["Ok"], actionStyle: [.cancel], action: [{ ok in
                    print("Cancle")
                }])
            }else{
                VC.japaModel = japaMandalaModel(mantraSet: japaModel?.mantraSet, mantra: mantraText, NumberOfSets: numberOfSets)
            }
            
        case Constants.skipBtn:
                VC.japaModel = japaMandalaModel(mantraSet: japaModel?.mantraSet, mantra: "", NumberOfSets: 0)
        default:
            print("No case")
            
        }
       
        
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    
}


extension MantraAddingViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == mantraSetsTextField {
            openPicker()
        }
        return false
    }
   
    override func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mantraSetsTextField.text = "\(row + 1)"
        japaModel?.NumberOfSets = row + 1
    }
    
}
