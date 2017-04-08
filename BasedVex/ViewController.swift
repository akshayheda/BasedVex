//
//  ViewController.swift
//  BasedVex
//
//  Created by BASEHacks on 4/8/17.
//  Copyright © 2017 BASEHacks. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

        override func viewDidLoad() {
        
        super.viewDidLoad()
        Alamofire.request("https://api.vexdb.io/v1/get_teams?region=california").responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

