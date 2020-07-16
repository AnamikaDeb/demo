//
//  ResponseModel.swift
//  RechargeApp
//
//  Created by Anamika Deb on 6/2/20.
//  Copyright © 2020 Anamika Deb. All rights reserved.
//

import Foundation
import ObjectMapper

class LocationResponse: Mappable {
    var poiList: [PoiList]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        poiList <- map["poiList"]
    }
}

class PoiList: Mappable {
    var fleetType: String?
    var id: Int?
    var heading: Double?
    var lat: Double?
    var long: Double?

    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        fleetType <- map["fleetType"]
        id <- map["id"]
        heading <- map["heading"]
        lat <- map["coordinate.latitude"]
        long <- map["coordinate.longitude"]
    }
}
