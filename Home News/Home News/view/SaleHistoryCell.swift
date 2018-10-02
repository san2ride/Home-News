//
//  SaleHistoryCell.swift
//  Home News
//
//  Created by Jason Sanchez on 10/1/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

class SaleHistoryCell: UITableViewCell {
    
    @IBOutlet weak var soldDateLabel: UILabel!
    @IBOutlet weak var soldPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(saleHistory: SaleHistory) {
        soldDateLabel.text = (saleHistory.soldDate as Date?)?.toString
        soldPriceLabel.text = saleHistory.soldPrice.currencyFormatter
    }
}
