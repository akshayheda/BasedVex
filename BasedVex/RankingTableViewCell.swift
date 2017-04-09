//
//  RankingTableViewCell.swift
//  BasedVex
//
//  Created by Akshay on 4/8/17.
//  Copyright © 2017 BASEHacks. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    @IBOutlet weak var teamNumber: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var winloss: UILabel!
    @IBOutlet weak var teamName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
