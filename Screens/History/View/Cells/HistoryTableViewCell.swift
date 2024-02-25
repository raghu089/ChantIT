//
//  HistoryTableViewCell.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 09/09/23.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var serialN: UILabel!
    
    @IBOutlet weak var dateText: UILabel!
    
    @IBOutlet weak var mantraText: UILabel!
    
    @IBOutlet weak var mantraCount: UILabel!
    
    var japaEntity: JapaMandalaEntity? {
        didSet{
            updateCell()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func updateCell(){
        guard let japaEntity else { return }
        
        dateText.text = japaEntity.date
        mantraText.text = japaEntity.mantra
        mantraCount.text = japaEntity.count
        
    }

}
