//
//  HistoryTableViewCell.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 09/09/23.
//

import UIKit
import CoreData

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var serialN: UILabel!
    
    @IBOutlet weak var dateText: UILabel!
    
    @IBOutlet weak var mantraText: UILabel!
    
    @IBOutlet weak var mantraCount: UILabel!
    
    var japaEntity: JapaMandalaEntity? {
        didSet{
            updateJapaCell()
        }
    }
    
    var dhyanaEntity: DhyanaEntity? {
        didSet{
            updateDhyanaCell()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func updateJapaCell(){
        guard let japaEntity else { return }
        
        dateText.text = japaEntity.date
        mantraText.text = japaEntity.mantra
        mantraCount.text = japaEntity.count
        
    }
    
    func updateDhyanaCell(){
        guard let dhyanaEntity else { return }
        
        dateText.text = dhyanaEntity.date
        mantraText.text = dhyanaEntity.taget
        mantraCount.text = dhyanaEntity.time
        
    }

}
