//
//  MeditationTimerViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 21/08/23.
//

import UIKit

class MeditationTimerViewController: audioPlayer {
    
    
    @IBOutlet weak var timerText: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var restartBtn: UIButton!
    
    @IBOutlet weak var finishBtn: UIButton!
    
    var time: Time?
    private var setTimer = SetTimer()
    private var timer = Timer()
    private var manager = DataBaseManger()
    var timerCounting = false
    var count = 0
    var isTimeSet = false
    var totalSec: Float?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        updateUI()
        showAlert()
        hideKeyboardWhenTappedAround()
    }
    
    //UI Updates
    
    func updateUI(){
        navBackBtn(Constants.dhyana)
        finishBtn.underlineText("Finish")
        
        totalSec = Float(setTimer.hourMinuteSecToSeconds(time?.hour ?? 0, time?.miniute ?? 0, time?.sec ?? 0))
        count = Int(totalSec ?? 0)
        
        let timeString = setTimer.makeTimeString(time?.hour ?? 0, time?.miniute ?? 0,  time?.sec ?? 0)
        timerText.text = timeString
        
        if isTimeSet == true {
            progressView.setProgress(0, animated: true)
            finishBtn.isHidden = true
        }else{
            progressView.isHidden = true
            finishBtn.isHidden = false
        }
        soundBtn(#selector(soundOnOff))
    }
    
    func showAlert(){
        let playing = player?.isPlaying
        popAlert(title: "Enable Background Music?", message: "Would you like to have soothing background music while meditating?", actionTitles: ["Yes","No"], actionStyle: [.default, .cancel], action: [{ yes in
            self.setBarbuttonImage(playing ?? false)
            self.playMusic()
        },
        { no in
            self.stop()
        }])
        
    }
    
    
    @IBAction func actionBtn(_ sender: UIButton) {
        
        if timerCounting {
            timerCounting = false
            restartBtn.setTitle("Start", for: .normal)
            timer.invalidate()
        }else{
            timerCounting = true
            restartBtn.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counting), userInfo: nil, repeats: true)
        }
        
    }
    
    
    @IBAction func finishAction(_ sender: Any) {
      let totalTime = setTimer.secondsToHourMinuteSecond(count)
      time = Time(hour: totalTime.0, miniute: totalTime.1, sec: totalTime.2)
      navigateToresultVc()
    }
    
    @objc func counting(){
        if isTimeSet == true {
            count -= 1
            
            let sec: Float = 1/(totalSec ?? 0)
            
            DispatchQueue.main.async {
                self.progressView.progress += sec
            }
            
            if count == 0 {
                navigateToresultVc()
            }else if count < 4 {
                playtimeAlert()
            }
            
        }else{
            count += 1
        }
        updateCount()
    }
    
    // Updating time to label
    func updateCount(){
        let time = setTimer.secondsToHourMinuteSecond(count)
        let timeString = setTimer.makeTimeString(time.0, time.1, time.2)
        timerText.text = timeString
    }
    

    //Result VC navigation
    func navigateToresultVc(){
        saveData()
        timer.invalidate()
        let VC = pushDataVc(Constants.resultVC) as! ResultViewController
        VC.time = time
        VC.isJapaM = false
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    func setBarbuttonImage(_ playing: Bool){
        
        if let soundButton = navigationItem.rightBarButtonItem, let soundBtnImage = UIImage(named: playing == true ? "soundOff" : "soundOn") {
                soundButton.image = soundBtnImage
            }
        
    }
    
    // music turnOn and off
    @objc func soundOnOff(){
        let playing = player?.isPlaying
        
        setBarbuttonImage(playing ?? false)
        
        playing == true ? stop() : playMusic()

    }
    
    //Save data to database
    
    func saveData(){
        
        let date = Date.getCurrentDate()
        
        let timeString = setTimer.makeTimeString(time?.hour ?? 0, time?.miniute ?? 0,  time?.sec ?? 0)
        var target = ""
        if isTimeSet == true {
            target = "Hit "
        }else{
            target = "Free"
        }
        
        let dhynaData = Dhyana(date: date, time: timeString, taget: target)
        manager.updateDhyanaData(dhynaData)
        
    }

}
