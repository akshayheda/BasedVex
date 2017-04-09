//
//  RankingTableViewController.swift
//  BasedVex
//
//  Created by Akshay on 4/8/17.
//  Copyright © 2017 BASEHacks. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RankingTableViewController: UITableViewController {
    var teamNumbers = [String]()
    var rank = [Int]()
    var wins = [Int]()
    var losses = [Int]()
    var ties = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://api.vexdb.io/v1/get_rankings?sku=RE-VRC-16-5372").responseJSON { response in
            let json = JSON(response.result.value)
            
            let tempTeamNumbers = json["result"].arrayValue.map({$0["team"].stringValue})
            
            for string in tempTeamNumbers {
                self.teamNumbers.append(string)
            }

            let tempRank = json["result"].arrayValue.map({$0["rank"].intValue
            })
            
            for int in tempRank {
                self.rank.append(int)
            }
            let tempWins = json["result"].arrayValue.map({$0["wins"].intValue})
            
            for int in tempWins {
                self.wins.append(int)
            }
            let tempLosses = json["result"].arrayValue.map({$0["losses"].intValue})
            
            for int in tempLosses {
                self.losses.append(int)
            }

            let tempTies = json["result"].arrayValue.map({$0["ties"].intValue})
            
            for int in tempTies {
                self.ties.append(int)
            }


            
            self.tableView.reloadData()
            
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return teamNumbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! RankingTableViewCell
        cell.teamNumber.text = self.teamNumbers[indexPath.row]
        cell.rank.text = String(self.rank[indexPath.row])
        cell.winloss.text = "\(wins[indexPath.row])-\(ties[indexPath.row])-\(losses[indexPath.row])"

        return cell
    }

    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


