//
//  ToiToisClass.swift
//  FindMyToiToi
//
//  Created by master on 01.07.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import Foundation
import MapKit

class ToiTois{
    var toiletts = [ToiToiWegpunkt]()
    
    var bekiniBerlin = ToiToiWegpunkt()
    var zooBerlin = ToiToiWegpunkt()
    var zahnArtz = ToiToiWegpunkt()
    var appleStore = ToiToiWegpunkt()
    var siegesSaeule = ToiToiWegpunkt()
    var motelOne = ToiToiWegpunkt()
    var spreeUfer = ToiToiWegpunkt()
    var brandenburgerTor = ToiToiWegpunkt()
    var berlinerDom = ToiToiWegpunkt()
    var kanzerlAmt = ToiToiWegpunkt()
    var niveaStore = ToiToiWegpunkt()
    var fernsehTurm = ToiToiWegpunkt()
    
    
    
    init(){
        self.bekiniBerlin.coordinate = CLLocationCoordinate2D(latitude: 52.505486, longitude: 13.335772)
        self.bekiniBerlin.title = "ToiToi Bekini Berlin"
        self.bekiniBerlin.subtitle = "Budapester Str. 38-50"
        
        self.zooBerlin.coordinate = CLLocationCoordinate2D(latitude: 52.505538, longitude: 13.339806)
        self.zooBerlin.title = "ToiToi Zoo Berlin Elefantentor"
        self.zooBerlin.subtitle = "Budapester Straße 34"
        
        self.zahnArtz.coordinate = CLLocationCoordinate2D(latitude: 52.504807, longitude: 13.342595)
        self.zahnArtz.title = "ToiToi Zahnarzt"
        self.zahnArtz.subtitle = "Kurfürstenstraße 87"
        
        self.appleStore.coordinate = CLLocationCoordinate2D(latitude: 52.504115, longitude: 13.345664)
        self.appleStore.title = "ToiToi Elektroshop"
        self.appleStore.subtitle = "Kurfürstenstraße 80"
        
        self.siegesSaeule.coordinate = CLLocationCoordinate2D(latitude: 52.513805, longitude: 13.350406)
        self.siegesSaeule.title = "ToiToi Siegessäule"
        self.siegesSaeule.subtitle = "Großer Stern"
        
        self.motelOne.coordinate = CLLocationCoordinate2D(latitude: 52.519851, longitude: 13.356006)
        self.motelOne.title = "ToiToi Motel One"
        self.motelOne.subtitle = "Lüneburger Straße 20"
        
        self.spreeUfer.coordinate = CLLocationCoordinate2D(latitude: 52.516952, longitude: 13.357937)
        self.spreeUfer.title = "ToiToi Spreeufer"
        self.spreeUfer.subtitle = "Johan-Forster-Dulles-Alle"
        
        self.brandenburgerTor.coordinate = CLLocationCoordinate2D(latitude: 52.51656, longitude: 13.380919)
        self.brandenburgerTor.title = "ToiToi Brandenburger Tor"
        self.brandenburgerTor.subtitle = "Pariser Platz"
        
        self.berlinerDom.coordinate = CLLocationCoordinate2D(latitude: 52.51865, longitude: 13.401496)
        self.berlinerDom.title = "ToiToi Berliner Dom"
        self.berlinerDom.subtitle = "Am Lustgarten"
        
        self.kanzerlAmt.coordinate = CLLocationCoordinate2D(latitude: 52.519407, longitude: 13.369203)
        self.kanzerlAmt.title = "ToiToi Kanzler Amt"
        self.kanzerlAmt.subtitle = "Willy-Brandt-Straße 1"
        
        self.niveaStore.coordinate = CLLocationCoordinate2D(latitude: 52.517155, longitude: 13.388065)
        self.niveaStore.title = "ToiToi Nivea Store"
        self.niveaStore.subtitle = "Unter den Linden 28"
        
        self.fernsehTurm.coordinate = CLLocationCoordinate2D(latitude: 52.521581, longitude: 13.408095)
        self.fernsehTurm.title = "ToiToi Fernsehturm"
        self.fernsehTurm.subtitle = "Panoramastraße 1A"
        
        self.toiletts.append(bekiniBerlin)
        self.toiletts.append(zooBerlin)
        self.toiletts.append(zahnArtz)
        self.toiletts.append(appleStore)
        self.toiletts.append(siegesSaeule)
        self.toiletts.append(motelOne)
        self.toiletts.append(siegesSaeule)
        self.toiletts.append(spreeUfer)
        self.toiletts.append(brandenburgerTor)
        self.toiletts.append(berlinerDom)
        self.toiletts.append(kanzerlAmt)
        self.toiletts.append(niveaStore)
        self.toiletts.append(fernsehTurm)
        
    }
    
    public func addAnno(anno: ToiToiWegpunkt){
        toiletts.append(anno)
    }

}