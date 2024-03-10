//
//  HomeViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 04/08/23.
//

import UIKit




class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var JapaMandal: UIButton!
    
    @IBOutlet weak var Dhyana: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    
    //UI Updates
    
    func updateUI(){
        JapaMandal.updateShadow()
        Dhyana.updateShadow()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    @IBAction func CategoriesAction(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
        switch sender.titleLabel?.text {
            
          case Constants.japaMandala:
                pushViewcontroller(Constants.japaMandalaVC)
          case Constants.dhyana:
                pushViewcontroller(Constants.meditaionHomeVC)
          default:
            print("No Case")
        }
        
    }
    

}
