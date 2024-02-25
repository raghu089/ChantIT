//
//  PickerViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 05/10/23.
//

import UIKit

struct Time {
    let hour: Int
    let miniute: Int
    let sec: Int
}

class PickerViewController: UIViewController {
    
    var timerPicker: UIPickerView!
    var toolBar = UIToolbar()
    var time : Time?
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        bgUI()
        pickerSetup()
        toolbarSteup()
    }

    func bgUI(){
        // Configure visual effect view
        visualEffectView.frame = view.bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        visualEffectView.backgroundColor = UIColor(named: Constants.backGround)
        visualEffectView.alpha = 0.6
        view.addSubview(visualEffectView)
        visualEffectView.isHidden = true
        addGesture()
    }
    
    func pickerSetup(){
        // Create Timer Picker
        timerPicker = UIPickerView()
        timerPicker.dataSource = self
        timerPicker.delegate = self
        timerPicker.autoresizingMask = .flexibleWidth
        timerPicker.frame = CGRect(x: 0, y: view.frame.height - 200, width: view.frame.width, height: 250)
        timerPicker.backgroundColor = UIColor(named: Constants.orangeWhite)
        view.addSubview(timerPicker)
        timerPicker.isHidden = true
    }
    
    func toolbarSteup(){
        // Create Tool bar
                toolBar = UIToolbar(frame: CGRect(x: 0, y: view.frame.height - 200, width: view.frame.width , height: 44))
                let label = UILabel()
                label.text = "HH:mm:ss"
                label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
                label.textColor = UIColor(named: Constants.blackDarkLight)
                let labelItem = UIBarButtonItem(customView: label)

                let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
                let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))
               toolBar.setItems([labelItem, flexibleSpace, doneButton], animated: false)
               self.view.addSubview(toolBar)
               toolBar.isHidden = true
    }
    
    func addGesture(){
        
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        
        visualEffectView.addGestureRecognizer(viewTap)
    }
    
    @objc func onDoneButtonTapped() {
        closePicker()
        let vc = pushDataVc(Constants.meditationTimerVC) as! MeditationTimerViewController
        vc.time = time
        vc.isTimeSet = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func dismissView() {
        closePicker()
    }
    
    private func closePicker(){
        toolBar.isHidden = true
        timerPicker.isHidden = true
        visualEffectView.isHidden = true
    }
    
    func openPicker(){
        toolBar.isHidden = false
        timerPicker.isHidden = false
        visualEffectView.isHidden = false
    }
  

}


extension PickerViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
                   return 24 // 23 hours
        } else if component == 0{
                   return 60 // 59 minutes
        }else{
                   return 61 // 60 sec
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return "\(row)"
     }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedHours = pickerView.selectedRow(inComponent: 0)
        let selectedMinutes = pickerView.selectedRow(inComponent: 1)
        let selcectedSeconds = pickerView.selectedRow(inComponent: 2)
        
        
       // let totalSeconds = (selectedHours * 3600) + (selectedMinutes * 60)
        time = Time(hour: selectedHours, miniute: selectedMinutes, sec: selcectedSeconds)
        print(selectedHours, selectedMinutes, selcectedSeconds)
        // Use totalSeconds for your timer logic
    }
    

    
}
