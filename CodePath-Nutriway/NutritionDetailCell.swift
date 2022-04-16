//
//  NutritionDetailCell.swift
//  CodePath-Nutriway
//
//  Created by Admin Mac on 4/15/22.
//

import UIKit

class NutritionDetailCell: UITableViewCell {

    @IBOutlet weak var nutritionLabel: UILabel!
    @IBOutlet weak var nutritionAmountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
