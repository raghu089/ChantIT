//
//  ResultViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 23/02/24.
//

import UIKit


class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var setOmessage: UILabel!
    @IBOutlet weak var history: UIButton!
    @IBOutlet weak var totalOTIme: UILabel!
    
    var result: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
          updateUi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //Ui Update
    func updateUi(){
        
        totalOTIme.text = result?.totalOT
        setOmessage.text = result?.setOM
        history.underlineText("History")

    }
    
    @IBAction func homeBtnAction(_ sender: UIButton){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func historyBtn(_ sender: Any) {
        
        pushViewcontroller(Constants.historyVC)
        
    }
    
}
