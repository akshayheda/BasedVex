//
//  MatchTableViewCell.swift
//  BasedVex
//
//  Created by Akshay on 4/9/17.
//  Copyright © 2017 BASEHacks. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var matchNumber: UILabel!
    
    @IBOutlet weak var red1: UILabel!

    @IBOutlet weak var red2: UILabel!
    
    @IBOutlet weak var red3: UILabel!
    
    @IBOutlet weak var blue1: UILabel!
    
    @IBOutlet weak var blue2: UILabel!
    
    @IBOutlet weak var blue3: UILabel!
    
    @IBOutlet weak var redScore: UILabel!
    
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var blueScore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
