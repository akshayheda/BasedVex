
//
//  MatchesViewController.swift
//  BasedVex
//
//  Created by Akshay on 4/9/17.
//  Copyright © 2017 BASEHacks. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MatchesViewController: UIViewController{
    
    var matchNumber = [String]()
    
     var red1 = [String]()
     var red2 = [String]()
     var red3 = [String]()
    var redSit = [String]()
    var blue1 = [String]()
    var blue2 = [String]()
    var blue3 = [String]()
    var blueSit = [String]()
    
    var redScore = [String]()
    var blueScore = [String]()
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://api.vexdb.io/v1/get_matches?sku=RE-VRC-16-5372").responseJSON { response in
            let json = JSON(response.result.value)
            
            let matchNumber = json["result"].arrayValue.map({$0["matchnum"].stringValue})
            
            let red1 = json["result"].arrayValue.map({$0["red1"].stringValue})
            let red12 = json["result"].arrayValue.map({$0["red2"].stringValue})
            let red3 = json["result"].arrayValue.map({$0["red3"].stringValue})
            let redSit = json["result"].arrayValue.map({$0["redsit"].stringValue})
            let blue1 = json["result"].arrayValue.map({$0["blue1"].stringValue})
            let blue2 = json["result"].arrayValue.map({$0["blue2"].stringValue})
            let blue3 = json["result"].arrayValue.map({$0["blue3"].stringValue})
            let blueSit = json["result"].arrayValue.map({$0["bluesit"].stringValue})
            
            let redScore = json["result"].arrayValue.map({$0["redscore"].stringValue})
            let blueScore = json["result"].arrayValue.map({$0["bluescore"].stringValue})
            
                    }
        // Do any additional setup after loading the view.
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
