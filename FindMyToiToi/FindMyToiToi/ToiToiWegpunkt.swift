//
//  ToiToiWegpunkt.swift
//  FindMyToiToi
//
//  Created by master on 01.07.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import Foundation
import MapKit

class ToiToiWegpunkt: MKPointAnnotation{
    
    let nameDerAnnotation = "ToiToi"
    var rating: Int = 0
    var straße: String = ""
    var img: UIImage!
}
