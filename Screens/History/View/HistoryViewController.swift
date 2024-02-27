//
//  HistoryViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 21/08/23.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var clearHistoryBtn: UIButton!
    
    @IBOutlet weak var NoRecords: UILabel!
    private var JapaDetails : [JapaMandalaEntity] = []
    private var DhyanaDetails : [DhyanaEntity] = []
    private var manager = DataBaseManger()
    var isJapaMandal = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure(){
        loadDataBase()
        updateUI()
    }
    
    
    //UI Updates
    
    func updateUI(){
        navBackBtn(Constants.history)
        clearHistoryBtn.applyBorderProperties()
        tableView.reloadData()
        
        if (isJapaMandal && JapaDetails.isEmpty) || (!isJapaMandal && DhyanaDetails.isEmpty) {
            clearHistoryBtn.isHidden = true
            NoRecords.text = "No records available"
        } else {
            clearHistoryBtn.isHidden = false
            NoRecords.isHidden = true
        }
    }
    
    // CoreData
    func loadDataBase(){
        if isJapaMandal == true{
            JapaDetails = manager.fetchJapaDetails()
        }else{
            DhyanaDetails = manager.fetchDhyanaDetails()
        }
        tableView.reloadData()
    }
    
    @IBAction func clearHistoryAction(_ sender: Any) {
        
        popAlert(title: "Clear All History", message: "Are you sure you want to delete all your history?", actionTitles: ["Ok", "Cancel"], actionStyle: [.default, .cancel], action: [{
            ok in
            if self.isJapaMandal == true{
                self.manager.deleteAllData(Constants.JapaEntity)
            }else{
                self.manager.deleteAllData(Constants.dhyanaEntity)
            }
            
            DispatchQueue.main.async {
                self.configure()
            }
            
        },{ cancel in
            print("Not deleted")
        }
        ])
        
    }
    
}


extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isJapaMandal == true{
            return JapaDetails.count
        }else{
            return DhyanaDetails.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        if isJapaMandal == true{
            let japa = JapaDetails[indexPath.row]
            cell.japaEntity = japa
        }else{
            let dhyana = DhyanaDetails[indexPath.row]
            cell.dhyanaEntity = dhyana
        }
        cell.serialN.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        53
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let VC = pushDataVc(Constants.historyDetailsVC) as! HistoryDetailsViewController
        if isJapaMandal == true {
            VC.japaEntity = JapaDetails[indexPath.row]
        }else{
            VC.dhyanaEntity = DhyanaDetails[indexPath.row]
        }
        VC.isJapa = isJapaMandal
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
}
