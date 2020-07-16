//
//  MapViewController.swift
//  RechargeApp
//
//  Created by Anamika Deb on 16/7/20.
//  Copyright © 2020 Anamika Deb. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var backButton: UIBarButtonItem!

    var poilist : PoiList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self as? MKMapViewDelegate
        let center = CLLocationCoordinate2D(latitude: poilist?.lat ?? 0, longitude: poilist?.long ?? 0)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        let annotation = MKPointAnnotation()
        annotation.title = poilist?.fleetType
        annotation.coordinate = CLLocationCoordinate2D(latitude: poilist?.lat ?? 0, longitude: poilist?.long ?? 0)
        self.mapView.addAnnotation(annotation)
        self.mapView.setRegion(region, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender:AnyObject)
    {
        self.dismiss(animated: true, completion: nil)
    }
}

