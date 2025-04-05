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
    var dhyanaEntity: DhyanaEntity?
    var isJapa = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isJapa == true{
            updateJapaUI()
        }else{
            updateDhyanaUI()
        }
         
        
    }
    
    //UI Updates
    
    func updateJapaUI(){
        navBackBtn(japaEntity?.date ?? "")
        mantraText.text = japaEntity?.mantra
        countText.text = japaEntity?.count
        setLbl.text = "Set: \(japaEntity?.setDetails ?? "-")"
    }  
     
    func updateDhyanaUI(){
        navBackBtn(dhyanaEntity?.date ?? "")
        mantraText.text = dhyanaEntity?.taget
        countText.text = dhyanaEntity?.time
        setLbl.isHidden = true
    }
}
