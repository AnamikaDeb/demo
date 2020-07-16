//
//  APIManager.swift
//  RechargeApp
//
//  Created by Anamika Deb on 6/2/20.
//  Copyright © 2020 Anamika Deb. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol DataModelDelegate: class {
    func didRecieveDataUpdate(data: [PoiList])
}

class APIManager {
    
    weak var delegate: DataModelDelegate?

    func getList()  {
        let url = "https://fake-poi-api.mytaxi.com/?p2Lat=53.394655&p1Lon=9.757589&p1Lat=53.694865&p2Lon=10.099891" // This will be your link        
        Alamofire.request(url, method: .get, parameters: nil).responseJSON { response in
//            print(response)
            
            switch response.result {
            case .success(let value):
                let jsonDict = JSON(value).dictionaryObject
                if let locationResponse = LocationResponse(JSON: jsonDict!), let poiList = locationResponse.poiList {
                        if poiList.count >= 0 {
                            self.delegate?.didRecieveDataUpdate(data: poiList)
                        }
                    }
             
            case .failure(let error):
                print(error)
            }
        }
    }
}
