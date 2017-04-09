//
//  TableViewController.swift
//  BasedVex
//
//  Created by Akshay on 4/8/17.
//  Copyright © 2017 BASEHacks. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var teamTable: UITableView!
    var numbers = [String]()
    var organization = [String]()
    var cities = [String]()
    var SenderTeam = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Alamofire.request("https://api.vexdb.io/v1/get_teams?sku=RE-VRC-16-5372").responseJSON { response in
            let json = JSON(response.result.value)
            
            let tempnumbers = json["result"].arrayValue.map({$0["number"].stringValue})
            for string in tempnumbers {
                self.numbers.append(string)
            }
            let tempOrg = json["result"].arrayValue.map({$0["team_name"].stringValue})
            for string in tempOrg {
                self.organization.append(string)
            }
            let tempcity = json["result"].arrayValue.map({$0["city"].stringValue})
            for string in tempcity {
                self.cities.append(string)
            }
            self.teamTable.delegate = self
            self.teamTable.dataSource = self
            self.teamTable.reloadData()

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! TableViewCell
            cell.number.text = self.numbers[indexPath.row]
            cell.location.text = self.cities[indexPath.row]
            cell.Organization.text = self.organization[indexPath.row]
            return cell
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        SenderTeam = numbers[indexPath.row]
        self.performSegue(withIdentifier: "showTeam", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let secondViewController = segue.destination as! teamInfoViewController
        
        // set a variable in the second view controller with the data to pass
        secondViewController.receivedData = SenderTeam as! String
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


