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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        print(japaModel?.mantraSet)
        print(japaModel?.mantra)
        print(japaModel?.NumberOfSets)
       
    }
    
    //UI Updates
    
    func updateUI(){
        navBackBtn(Constants.japaMandala)
        soundBtn()
        updateUitext()
    }

    func updateUitext(){
        guard let mantra = japaModel?.mantra else {
            return
        }
        mantraText.text = mantra
        
        guard let mantraSet = japaModel?.mantraSet else {
            return
        }
        
        setText.text = "Set: 1 * \(mantraSet)"
        totalText.text = "Total: 0"
    }
   

    @IBAction func actionBtn(_ sender: Any) {
        
    }
    
    
}
