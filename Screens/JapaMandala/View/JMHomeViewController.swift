//
//  JMHomeViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 13/08/23.
//

import UIKit


class JMHomeViewController: audioPlayer {
    
    
    @IBOutlet weak var mantraText: UILabel!
    
    @IBOutlet weak var setText: UILabel!
    
    @IBOutlet weak var totalText: UILabel!
    
    @IBOutlet weak var tapBtn: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var finishBtn: UIButton!
    
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
        soundBtn(#selector(soundOnOff))
        updateUitext()
        finishBtn.underlineText("Finish")
        if japaModel?.skip == false {
            progressView.setProgress(0, animated: true)
            finishBtn.isHidden = true
        }else{
            progressView.isHidden = true
            finishBtn.isHidden = false
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
      
        let mantra = (japaModel?.mantra ?? "").capitalized
        mantraText.text? = mantra
       
        setText.text = "Set: \(0) * \(Int(japaModel?.mantraSet ?? 1))"
        
        let total = totalChants()
        totalText.text = "Total: \(Int(total))"
    }
    
   
   
    
    @IBAction func actionBtn(_ sender: UIButton) {
        let totalChants = totalChants()
        //progress bar hidding
        if japaModel?.skip == false {
            let total: Float = 1/totalChants
            
            DispatchQueue.main.async {
                self.progressView.progress += total
            }
        }
        
        
        //Adding set count
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
        
        //Navigate to result
        if tap == Int(totalChants){
            navigateToresultVc()
        }
        
    }
    
    
    @IBAction func finishBtn(_ sender: UIButton) {
        
         navigateToresultVc()
    }
    
    //Result VC navigation
    func navigateToresultVc(){
        let VC = pushDataVc(Constants.resultVC) as! ResultViewController
        VC.result = Result(setOM: "Set: \(noOfset) * \(Int(japaModel?.mantraSet ?? 1))", totalOT: "\(tap)")
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    // music turnOn and off
    @objc func soundOnOff(){
        let playing = player?.isPlaying
        
        if let soundButton = navigationItem.rightBarButtonItem, let soundBtnImage = UIImage(named: playing == true ? "soundOff" : "soundOn") {
                soundButton.image = soundBtnImage
            }
        
        playing == true ? stop() : play()

    }


}
