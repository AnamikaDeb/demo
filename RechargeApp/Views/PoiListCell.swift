//
//  OfferListCell.swift
//  RechargeApp
//
//  Created by Anamika Deb on 6/2/20.
//  Copyright © 2020 Anamika Deb. All rights reserved.
//

import UIKit

class PoiListCell: UITableViewCell{
    @IBOutlet weak var latLbl : UILabel!
    @IBOutlet weak var longLbl : UILabel!
    @IBOutlet weak var typeLbl : UILabel!
    @IBOutlet weak var headingLbl : UILabel!

    
    func configureCell(poiList: PoiList)
    {
        self.latLbl.text = "Lat: \(poiList.lat ?? 0)"
        self.longLbl.text = "Long: \(poiList.long ?? 0)"
        self.typeLbl.text = "Type: \(poiList.fleetType ?? "")"
        self.headingLbl.text = "Heading: \(poiList.heading ?? 0)"
    }
}
