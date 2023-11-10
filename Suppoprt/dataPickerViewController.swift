//
//  dataPickerViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 10/11/23.
//

import UIKit

class dataPickerViewController: UIViewController {
    
    
    var dataPicker: UIPickerView!
    var toolBar = UIToolbar()
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
        dataPicker = UIPickerView()
        dataPicker.dataSource = self
        dataPicker.delegate = self
        dataPicker.autoresizingMask = .flexibleWidth
        dataPicker.frame = CGRect(x: 0, y: view.frame.height - 200, width: view.frame.width, height: 250)
        dataPicker.backgroundColor = UIColor(named: Constants.orangeWhite)
        view.addSubview(dataPicker)
        dataPicker.isHidden = true
    }
    
    
    
    func toolbarSteup(){
        // Create Tool bar
                toolBar = UIToolbar(frame: CGRect(x: 0, y: view.frame.height - 200, width: view.frame.width , height: 44))
               
                let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
                let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))
               toolBar.setItems([flexibleSpace, doneButton], animated: false)
               self.view.addSubview(toolBar)
               toolBar.isHidden = true
    }
    
    func addGesture(){
        
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        
        visualEffectView.addGestureRecognizer(viewTap)
    }
    
    @objc func onDoneButtonTapped() {
       
        closePicker()
       
    }
    
    @objc func dismissView() {
        closePicker()
    }
    
    private func closePicker(){
        toolBar.isHidden = true
        dataPicker.isHidden = true
        visualEffectView.isHidden = true
    }
    
    func openPicker(){
        toolBar.isHidden = false
        dataPicker.isHidden = false
        visualEffectView.isHidden = false
    }
  
    
}


extension dataPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        20
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(row + 1)")
    }
    
}


