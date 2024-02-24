//
//  MeditationTimerViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 21/08/23.
//

import UIKit

class MeditationTimerViewController: UIViewController {
    
    
    @IBOutlet weak var timerText: UILabel!
    
    @IBOutlet weak var recordedTime: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var restartBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    //UI Updates
    
    func updateUI(){
        navBackBtn(Constants.dhyana)
    //    soundBtn()
    }
    
    
    @IBAction func actionBtn(_ sender: Any) {
    }
    

}
