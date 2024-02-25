//
//  HistoryDetailsViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 21/08/23.
//

import UIKit

class HistoryDetailsViewController: UIViewController {

    
    @IBOutlet weak var mantraText: UILabel!
    
    @IBOutlet weak var countText: UILabel!
    
    @IBOutlet weak var setLbl: UILabel!
    
    var japaEntity: JapaMandalaEntity?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         updateUI()
        
    }
    
    //UI Updates
    
    func updateUI(){
        navBackBtn("09/11/2023")
        mantraText.text = japaEntity?.mantra
        countText.text = japaEntity?.count
        setLbl.text = "Set: \(japaEntity?.setDetails ?? "-")"
    }  

}
