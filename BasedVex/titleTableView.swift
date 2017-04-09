//
//  titleTableView.swift
//  BasedVex
//
//  Created by BASEHacks on 4/8/17.
//  Copyright © 2017 BASEHacks. All rights reserved.
//

import UIKit

class titleTableView: UITableView {

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            var cell: IntroductionCell = self.tableView.dequequeReusableCellWithIdentifier("IntroCell") as! IntroductionCell; cell.labelCellText.text = textArray[indexPath.row].uppercaseString
            return cell
        }
        else {
            var cell1: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("IntroCell") as! UITableViewCell
            return cell1
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
