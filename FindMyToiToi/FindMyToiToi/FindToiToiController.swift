//
//  FindToiToiController.swift
//  FindMyToiToi
//
//  Created by master on 01.07.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class FindToiToiController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var stopNavBtn: UIButton!
    
    var locationManger = CLLocationManager()
    //var viewC = ViewController()
    var toiletts: ToiTois!
    var toitois: [MKPointAnnotation]!
    var annotationUeb = ToiToiWegpunkt()
    
    var lastLoc: CLLocationCoordinate2D!
    var destination = CLLocationCoordinate2D()
    
    var startNav: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let toiletts = viewC.toitoi
        /*for anno in toiletts.toiletts{
            print()
        }*/
        stopNavBtn.hidden = true
        toitois = toiletts.toiletts
        locationManger.requestAlwaysAuthorization()
        self.map.delegate = self
        map.showsUserLocation = true
        
        map.addAnnotations(toitois)
        
    }
    @IBAction func stopingNav(sender: AnyObject) {
        startNav = false
        self.map.removeOverlays(self.map.overlays)
        stopNavBtn.hidden = true
    }
    
    /**
     Event if Button touched on the annotationView
     **/
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        if control == view.leftCalloutAccessoryView{
            startNav = true
            destination = (view.annotation?.coordinate)!
            stopNavBtn.hidden = false
        }
        if control == view.rightCalloutAccessoryView{
            annotationUeb = (view.annotation) as! ToiToiWegpunkt
            self.performSegueWithIdentifier("bewerter", sender: self)
        }
    }
    
    /**
     Shows current location of user
     Event if Navbtn touched on the annotationView calk a rout
     between userLocation and annotation
     **/
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation){
        
        let currentLocation = (userLocation.location?.coordinate)!
        
        if(startNav){
            calkRoute(currentLocation, destination: destination)
        }
        
        self.map.region = MKCoordinateRegionMakeWithDistance(currentLocation, 1500, 1500)
        
    }
    
    
    /**
     Method for routecalkulation
    **/
    func calkRoute(currentLocation: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        
         let sourcePlacemark = MKPlacemark(coordinate: currentLocation, addressDictionary: nil)
         let destinationPlacemark = MKPlacemark(coordinate: destination, addressDictionary: nil)
         
         let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
         let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
         
         let directionRequest = MKDirectionsRequest()
         directionRequest.source = sourceMapItem
         directionRequest.destination = destinationMapItem
         directionRequest.transportType = .Automobile
         
         let directions = MKDirections(request: directionRequest)
         directions.calculateDirectionsWithCompletionHandler{
         (response, error) -> Void in
         
         guard let response = response else {
            if error != nil{
                //TODO: alert:"go back to street"*/
            }
                return
         }
         self.lastLoc = currentLocation
         let route = response.routes[0]
         self.map.removeOverlays(self.map.overlays)
         self.map.addOverlay((route.polyline), level: MKOverlayLevel.AboveRoads)
         }
    }
    
    /**
     Add annotations
     Add Buttons on annotations
    **/
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?
    {
        if(!(annotation is ToiToiWegpunkt) ||
            ((annotation as! ToiToiWegpunkt).nameDerAnnotation != "ToiToi")){
            return nil
        }
        let reuseId = "Toi"
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if annotationView == nil
        {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            annotationView?.canShowCallout = true
            
        }
        else
        {
            annotationView?.annotation = annotation
        }
        let button = UIButton(type: UIButtonType.Custom)
        let button2 = UIButton(type: .DetailDisclosure)
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.setImage(UIImage(named: "Navicon.png"), forState: .Normal)
        
        annotationView?.leftCalloutAccessoryView = button
        annotationView?.rightCalloutAccessoryView = button2
        annotationView?.image = UIImage(named: "Navicon.png")
        
        
        return annotationView
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer{
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.greenColor()
        renderer.lineWidth = 4.0
        return renderer
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationVC = segue.destinationViewController as! BewertungsController
        destinationVC.annotation = annotationUeb
        destinationVC.toiletts = toiletts
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
