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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       
    }
    
    //UI Updates
    
    func updateUI(){
        navBackBtn(Constants.japaMandala)
        soundBtn()
    }

   

    @IBAction func actionBtn(_ sender: Any) {
        
    }
    
    
}
