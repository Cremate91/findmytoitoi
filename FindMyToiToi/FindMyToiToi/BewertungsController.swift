//
//  BewertungsController.swift
//  FindMyToiToi
//
//  Created by master on 01.07.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit
import MapKit


class BewertungsController: UIViewController {

    
    @IBOutlet weak var nameTF: UILabel!
    @IBOutlet weak var ortTF: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var toitoiImg: UIImageView!
    
    var annotation = ToiToiWegpunkt()
    var toiletts: ToiTois!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingControl.rating = annotation.rating
        if annotation.img == nil {
            toitoiImg.image = UIImage(named: "defaultPhoto")
        }else{
            toitoiImg.image = annotation.img
        }
        if(annotation != MKPointAnnotation()){
            nameTF.text = annotation.title
            if(annotation.subtitle == ""){
                ortTF.text = annotation.straße
            }else{
                ortTF.text = annotation.subtitle
            }
            
        }else{
            
        }
        
    }
    
    @IBAction func saveRating(sender: AnyObject) {
        annotation.rating = ratingControl.rating
        toiletts.toiletts[toiletts.toiletts.indexOf(annotation)!] = annotation
        self.performSegueWithIdentifier("saveRating", sender: self)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationVC = segue.destinationViewController as! FindToiToiController
        destinationVC.toiletts = toiletts
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
