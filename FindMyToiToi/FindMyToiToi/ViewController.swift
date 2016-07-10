//
//  ViewController.swift
//  FindMyToiToi
//
//  Created by master on 01.07.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let toitoi = ToiTois()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "findToiToi" {
            let svc = segue.destinationViewController as! FindToiToiController
            svc.toiletts = toitoi
        }
        if segue.identifier == "toiToiDetail"{
            let svc = segue.destinationViewController as! ToiToiDetailController
            svc.toi = toitoi
        }
        if segue.identifier == "bewertung"{
            let svc = segue.destinationViewController as! ToiToiTableViewController
            svc.toiletts = toitoi
        }
        
    }
    

}

