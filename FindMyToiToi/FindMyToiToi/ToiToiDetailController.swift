//
//  ToiToiDetailController.swift
//  FindMyToiToi
//
//  Created by master on 07.07.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit
import MapKit

class ToiToiDetailController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var toitoiName: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    var userLoc: CLLocationCoordinate2D!
    var locationManger = CLLocationManager()
    var annotation = ToiToiWegpunkt()
    var findController = FindToiToiController()
    var toi: ToiTois!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
        locationManger.delegate = self
        nameTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }


    // MARK: Actions
    @IBAction func saveNewToiToi(sender: AnyObject) {
        annotation.coordinate = (locationManger.location?.coordinate)!
        annotation.rating = ratingControl.rating
        annotation.straße = toitoiName.text!
        annotation.img = photoImageView.image
        annotation.title = "toitoi in " + toitoiName.text!
        toi.addAnno(annotation)
    }
    
    @IBAction func touchAttacke(sender: AnyObject) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        toitoiName.text = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
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
