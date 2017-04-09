//
//  teamInfoViewController.swift
//  BasedVex
//
//  Created by Akshay on 4/8/17.
//  Copyright © 2017 BASEHacks. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class teamInfoViewController: UIViewController {
    

    
    
    @IBOutlet weak var oprLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamNumberLabel: UILabel!
    @IBOutlet weak var trspLabel: UILabel!
    @IBOutlet weak var ccwmLabel: UILabel!
    @IBOutlet weak var dprLabel: UILabel!
    var receivedData = ""
    var teamName = ""
    var city = ""
    var region = ""
    var country = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://api.vexdb.io/v1/get_teams?sku=RE-VRC-16-5372&team=\(receivedData)").responseJSON { response in
            let json = JSON(response.result.value)

            let teamNameArray = json["result"].arrayValue.map({$0["team_name"].stringValue})
            self.teamName = teamNameArray[0]

            let cityArray = json["result"].arrayValue.map({$0["city"].stringValue})
            self.city = cityArray[0]

            
            let regionArray = json["result"].arrayValue.map({$0["region"].stringValue})
            self.region = regionArray[0]

            let countryArray = json["result"].arrayValue.map({$0["country"].stringValue})
            self.country = countryArray[0]
         
            
            self.teamNumberLabel.text = self.receivedData
            self.teamNameLabel.text = self.teamName
            self.locationLabel.text = "\(self.city), \(self.region), \(self.country)"
        }
        Alamofire.request("https://api.vexdb.io/v1/get_rankings?sku=RE-VRC-16-5372&team=\(receivedData)").responseJSON { response in
            let json2 = JSON(response.result.value)
            
            var wins = json2["result"].arrayValue.map({$0["wins"].stringValue})[0]
            var losses = json2["result"].arrayValue.map({$0["losses"].stringValue})[0]
            var ties = json2["result"].arrayValue.map({$0["ties"].stringValue})[0]
            var sp  = json2["result"].arrayValue.map({$0["sp"].stringValue})[0]
            var trsp  = json2["result"].arrayValue.map({$0["trsp"].stringValue})[0]
            var opr  = json2["result"].arrayValue.map({$0["opr"].stringValue})[0]
            var dpr  = json2["result"].arrayValue.map({$0["dpr"].stringValue})[0]
            var ccwm  = json2["result"].arrayValue.map({$0["ccwm"].stringValue})[0]
            
            self.oprLabel.text = "OPR: \(opr)"
            self.dprLabel.text = "DPR: \(dpr)"
            self.ccwmLabel.text = "CCWM: \(ccwm)"
            self.trspLabel.text = "TSRP: \(trsp)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
