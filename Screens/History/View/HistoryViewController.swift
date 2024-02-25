//
//  HistoryViewController.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 21/08/23.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let manager = DataBaseManger()
    private var JapaDetails : [JapaMandalaEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure(){
        updateUI()
        loadDataBase()
    }
    
    
    //UI Updates
    
    func updateUI(){
        navBackBtn(Constants.history)
    }
    
    // CoreData
    func loadDataBase(){
        JapaDetails = manager.fetchJapaDetails()
        tableView.reloadData()
    }

    

}


extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        JapaDetails.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        
        let japa = JapaDetails[indexPath.row]
        cell.japaEntity = japa
        cell.serialN.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        53
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let VC = pushDataVc(Constants.historyDetailsVC) as! HistoryDetailsViewController
        VC.japaEntity = JapaDetails[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
}
