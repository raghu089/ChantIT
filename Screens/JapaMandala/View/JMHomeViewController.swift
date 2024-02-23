//
//  JMHomeViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 13/08/23.
//

import UIKit

class JMHomeViewController: UIViewController {
    
    
    @IBOutlet weak var mantraText: UILabel!
    
    @IBOutlet weak var setText: UILabel!
    
    @IBOutlet weak var totalText: UILabel!
    
    @IBOutlet weak var tapBtn: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var japaModel : japaMandalaModel?
    var tap = 0
    var noOfset = 0
    var mSet = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    //UI Updates
    func updateUI(){
        navBackBtn(Constants.japaMandala)
        soundBtn()
        updateUitext()
        if japaModel?.skip == false {
            progressView.setProgress(0, animated: true)
        }else{
            progressView.isHidden = true
        }
    }
    
    //total chants
    func totalChants() -> Float{
        let mantraSet = japaModel?.mantraSet ?? 1
         
        let noOfSets = japaModel?.NumberOfSets ?? 1
        
        let total = (noOfSets * mantraSet)
        
        return total
    }
    
    //Update texts
    func updateUitext(){
      
        mantraText.text = japaModel?.mantra ?? ""
       
        setText.text = "Set: \(0) * \(Int(japaModel?.mantraSet ?? 1))"
        
        let total = totalChants()
        totalText.text = "Total: \(Int(total))"
    }
    
   
   
    
    @IBAction func actionBtn(_ sender: UIButton) {
        let totalChants = totalChants()
        if japaModel?.skip == false {
            let total: Float = 1/totalChants
            
            DispatchQueue.main.async {
                self.progressView.progress += total
            }
        }
        
        let noOfSets = Int(japaModel?.mantraSet ?? 1)
        self.tap += 1
        mSet += 1
        
        if mSet == noOfSets {
            noOfset += 1
            setText.text = "Set: \(noOfset) * \(Int(japaModel?.mantraSet ?? 1))"
            mSet = 0
        }
        
        totalText.text = "Total: \(tap)"
        self.tapBtn.setTitle("\(mSet)", for: .normal)
        
        
        if tap == Int(totalChants){
            let VC = pushDataVc(Constants.resultVC) as! ResultViewController
            VC.result = Result(setOM: "Set: \(noOfset) * \(Int(japaModel?.mantraSet ?? 1))", totalOT: "\(tap)")
            self.navigationController?.pushViewController(VC, animated: true)
        }
        
    }

    
}
