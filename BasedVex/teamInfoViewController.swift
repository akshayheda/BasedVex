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
    
    @IBOutlet weak var senderLabel: UILabel!
    var receivedData = ""
    var teamName = ""
    var city = ""
    var region = ""
    var country = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        senderLabel.text = receivedData
        Alamofire.request("https://api.vexdb.io/v1/get_teams?sku=RE-VRC-16-5372&team=\(receivedData)").responseJSON { response in
            let json = JSON(response.result.value)
            let teamNameArray = json["result"].arrayValue.map({$0["team_name"].stringValue})
            _ = teamNameArray[0]
            
            let cityArray = json["result"].arrayValue.map({$0["city"].stringValue})
            _ = cityArray[0]
            
            
            let regionArray = json["result"].arrayValue.map({$0["region"].stringValue})
            _ = regionArray[0]
            
            let countryArray = json["result"].arrayValue.map({$0["country"].stringValue})
            let country = countryArray[0]
            
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
