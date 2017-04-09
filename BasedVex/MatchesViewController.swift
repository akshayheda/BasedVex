
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

class MatchesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var matchTable: UITableView!
    
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
    
    var round = [String]()
    var instance = [String]()
    
    override func viewDidLoad() {
        Alamofire.request("https://api.vexdb.io/v1/get_matches?sku=RE-VRC-16-5372").responseJSON { response in
            let json = JSON(response.result.value)
            
            
            let tempmatchNumber = json["result"].arrayValue.map({$0["matchnum"].stringValue})
            for string in tempmatchNumber{
                self.matchNumber.append(string)
            }
            let tempred1 = json["result"].arrayValue.map({$0["red1"].stringValue})
            for string in tempred1{
                self.red1.append(string)
            }
            let tempred2 = json["result"].arrayValue.map({$0["red2"].stringValue})
            for string in tempred2{
                self.red2.append(string)
            }
            let tempred3 = json["result"].arrayValue.map({$0["red3"].stringValue})
            for string in tempred3{
                self.red3.append(string)
            }
            let tempredSit = json["result"].arrayValue.map({$0["redsit"].stringValue})
            for string in tempredSit{
                self.redSit.append(string)
            }
            let tempblue1 = json["result"].arrayValue.map({$0["blue1"].stringValue})
            for string in tempblue1{
                self.blue1.append(string)
            }
            let tempblue2 = json["result"].arrayValue.map({$0["blue2"].stringValue})
            for string in tempblue2{
                self.blue2.append(string)
            }
            let tempblue3 = json["result"].arrayValue.map({$0["blue3"].stringValue})
            for string in tempblue3{
                self.blue3.append(string)
            }
            let tempblueSit = json["result"].arrayValue.map({$0["bluesit"].stringValue})
            for string in tempblueSit{
                self.blueSit.append(string)
            }
            
            let tempredScore = json["result"].arrayValue.map({$0["redscore"].stringValue})
            for string in tempredScore{
                self.redScore.append(string)
            }
            let tempblueScore = json["result"].arrayValue.map({$0["bluescore"].stringValue})
            for string in tempblueScore{
                self.blueScore.append(string)
            }
            
            let tempround = json["result"].arrayValue.map({$0["round"].stringValue})
            for string in tempround{
                self.round.append(string)
            }
            let tempinstance = json["result"].arrayValue.map({$0["instance"].stringValue})
            for string in tempinstance{
                self.instance.append(string)
            }
            self.matchTable.delegate = self
            self.matchTable.dataSource = self
            self.matchTable.reloadData()
            
            

        }
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchNumber.count
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "match", for: indexPath) as! MatchTableViewCell

        cell.red1.text = self.red1[indexPath.row]
        cell.red2.text = self.red2[indexPath.row]
        cell.red3.text = self.red3[indexPath.row]
        cell.blue1.text = self.blue1[indexPath.row]
        cell.blue2.text = self.blue2[indexPath.row]
        cell.blue3.text = self.blue3[indexPath.row]
        
        cell.redScore.text = self.redScore[indexPath.row]
        cell.blueScore.text = self.blueScore[indexPath.row]

        if(Int(self.redScore[indexPath.row])! >
            Int(self.blueScore[indexPath.row])!) {
            cell.winner.text = "R"
        }
        if(Int(self.redScore[indexPath.row])! < Int(self.blueScore[indexPath.row])!) {
            cell.winner.text = "B"

        }
        
        if(Int(self.round[indexPath.row])! < 3) {
            cell.matchNumber.text = "Q\(self.matchNumber[indexPath.row])"
        }
        if(Int(self.round[indexPath.row])! == 3) {
            cell.matchNumber.text = "QF \(self.instance[indexPath.row])-\(self.matchNumber[indexPath.row])"
        }
        if(Int(self.round[indexPath.row])! == 4) {
            cell.matchNumber.text = "SF \(self.instance[indexPath.row])-\(self.matchNumber[indexPath.row])"
        }
        if(Int(self.round[indexPath.row])! == 5) {
            cell.matchNumber.text = "F \(self.instance[indexPath.row])-\(self.matchNumber[indexPath.row])"
        }
        
        return cell
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
