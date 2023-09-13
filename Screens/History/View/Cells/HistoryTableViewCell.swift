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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
