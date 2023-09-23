//
//  meditaionHomeViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 21/08/23.
//

import UIKit

class meditaionHomeViewController: UIViewController {
    
    
    @IBOutlet weak var setBtn: UIButton!
    
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var historyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    
    //UI Updates
    
    func updateUI(){
        continueBtn.applyBorderProperties()
        navBackBtn(Constants.dhyana)
    }
    

    
    @IBAction func actionBtn(_ sender: Any) {
    }
    
  

}
