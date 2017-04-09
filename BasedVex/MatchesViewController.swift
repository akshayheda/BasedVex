
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
import Foundation
var elos = [String:Float]()
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
        createElos()
        print(elos)
        
        
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
        print(red2)
        
        
        print(matchNumber.count)
        cell.red1.text = self.red1[indexPath.row]
        cell.red2.text = self.red2[indexPath.row]
        cell.red3.text = self.red3[indexPath.row]
        cell.blue1.text = self.blue1[indexPath.row]
        cell.blue2.text = self.blue2[indexPath.row]
        cell.blue3.text = self.blue3[indexPath.row]
        
        cell.redScore.text = self.redScore[indexPath.row]
        cell.blueScore.text = self.blueScore[indexPath.row]
        
        if(self.redScore[indexPath.row] > self.blueScore[indexPath.row]) {
            cell.winner.text = "R"
        }
        if(self.redScore[indexPath.row] < self.blueScore[indexPath.row]) {
            cell.winner.text = "B"
        }
        
        if(Int(self.round[indexPath.row])! < 3) {
            cell.matchNumber.text = "Q\(self.matchNumber[indexPath.row])"
        }
        if(Int(self.round[indexPath.row])! == 3) {
            cell.matchNumber.text = "QF \(self.instance[indexPath.row])-\(self.matchNumber[indexPath.row])"
        }
        if(Int(self.round[indexPath.row])! == 3) {
            cell.matchNumber.text = "SF \(self.instance[indexPath.row])-\(self.matchNumber[indexPath.row])"
        }
        if(Int(self.round[indexPath.row])! == 3) {
            cell.matchNumber.text = "F \(self.instance[indexPath.row])-\(self.matchNumber[indexPath.row])"
        }
        
        return cell
    }
    
    
    var events = [String]()
    func createElos() {
        Alamofire.request("https://api.vexdb.io/v1/get_events?season=starstruck&status=all").responseJSON { response in
            let json = JSON(response.result.value)
            let tempKeys = json["result"].arrayValue.map({$0["key"].stringValue})
            for string in tempKeys{
                self.events.append(string)
            }
    }
        for string in events {
            Alamofire.request("https://api.vexdb.io/v1/get_matches?round=2&sku=\(string)").responseJSON { response in
                let json = JSON(response.result.value)
                let matchNumber = json["result"].arrayValue.map({$0["matchnum"].stringValue})
                

                let red1 = json["result"].arrayValue.map({$0["red1"].stringValue})
                let red2 = json["result"].arrayValue.map({$0["red2"].stringValue})
                let blue1 = json["result"].arrayValue.map({$0["blue1"].stringValue})
                let blue2 = json["result"].arrayValue.map({$0["blue2"].stringValue})
                let redScore = json["result"].arrayValue.map({$0["redscore"].floatValue})
                let blueScore = json["result"].arrayValue.map({$0["bluescore"].floatValue})
                
                for index in 1...matchNumber.count {
                    if(elos[red1[index]]==nil) {elos[red1[index]] = 1500}
                    if(elos[red2[index]]==nil) {elos[red2[index]] = 1500}
                    if(elos[blue1[index]]==nil) {elos[blue1[index]] = 1500}
                    if(elos[blue2[index]]==nil) {elos[blue2[index]] = 1500}
                    
                    var combinedRedElo = elos[red1[index]]! + elos[red2[index]]!
                    var combinedBlueElo = elos[blue1[index]]! + elos[blue2[index]]!
                    var expectedRed: Float = (powf(10, Float(combinedRedElo/400))) / (powf(10, Float(combinedRedElo/400)) + (powf(10, Float(combinedBlueElo/400)) * Float(76)))
                    
                    var expectedBlue: Float = (powf(10, Float(combinedBlueElo/400))) / (powf(10, Float(combinedRedElo/400)) + (powf(10, Float(combinedBlueElo/400)) * Float(76)))
                
                    
                    var netRedElo = log10( abs( redScore[index] - blueScore[index]) + 1)*32*((redScore[index]) - (expectedRed))
                    var netBlueElo = log10( abs( redScore[index] - blueScore[index]) + 1)*32*((blueScore[index]) - (expectedBlue))
                    
                    var red1Elo = elos[red1[index]]
                    var red1EloChange = Float(red1Elo!/combinedRedElo)*Float(100)*Float(netRedElo)
                    var teamRed1 = red1[index]
                    elos[teamRed1] = elos[teamRed1]! + red1EloChange
                    
                    var red2Elo = elos[red2[index]]
                    var red2EloChange = Float(red2Elo!/combinedRedElo)*Float(100)*Float(netRedElo)
                    var teamRed2 = red2[index]
                    elos[teamRed2] = elos[teamRed2]! + red2EloChange
                    
                    var blue1Elo = elos[blue1[index]]
                    var blue1EloChange = Float(blue1Elo!/combinedBlueElo)*Float(100)*Float(netBlueElo)
                    var teamBlue1 = blue1[index]
                    elos[teamBlue1] = elos[teamBlue1]! + blue1EloChange
                    
                    var blue2Elo = elos[blue2[index]]
                    var blue2EloChange = Float(blue1Elo!/combinedBlueElo)*Float(100)*Float(netBlueElo)
                    var teamBlue2 = blue2[index]
                    elos[teamBlue2] = elos[teamBlue2]! + blue2EloChange
                    
                    
                    
                    
                    
                    
                    
                }
                
        }
       }
        
}
    
    
}


