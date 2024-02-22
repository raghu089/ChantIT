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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tapBtn.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 24)
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
    
    func totalChants() -> Float{
        let mantraSet = japaModel?.mantraSet ?? 1
         
        let noOfSets = japaModel?.NumberOfSets ?? 1
        
        let total = (noOfSets * mantraSet)
        
        return total
    }

    func updateUitext(){
      
        mantraText.text = japaModel?.mantra ?? ""
       
        setText.text = "Set: \(Int(japaModel?.NumberOfSets ?? 1)) * \(Int(japaModel?.mantraSet ?? 1))"
        
        let total = totalChants()
        totalText.text = "Total: \(Int(total))"
    }
    
   
   
    @IBAction func actionBtn(_ sender: UIButton) {
       
        
        
        if japaModel?.skip == false {
            let totalChants = totalChants()
            let total: Float = 1/totalChants
            
            DispatchQueue.main.async {
                self.progressView.progress += total
                
            }
        }
        
        self.tapBtn.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 24)
        self.tap += 1
        
        self.tapBtn.setTitle("\(self.tap)", for: .normal)
        
    }
    
    
}
