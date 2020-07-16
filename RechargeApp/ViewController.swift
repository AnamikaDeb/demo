//
//  ViewController.swift
//  RechargeApp
//
//  Created by Anamika Deb on 6/2/20.
//  Copyright © 2020 Anamika Deb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNoTextField: UITextField!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var rechargeButton: UIButton!
    @IBOutlet weak var offerListTableView: UITableView!
    @IBOutlet weak var offerSegment: UISegmentedControl!
    
    var poilist = [PoiList]()

    private let apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        offerListTableView.register(UINib(nibName: "PoiListCell", bundle: nil), forCellReuseIdentifier: "PoiListCell")
        
        LocationManager.sharedLocation.getCurrentLocation()

        apiManager.delegate = self
        
        DispatchQueue.global().async {
            self.apiManager.getList()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(poilist.count)
        return poilist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: "PoiListCell") as! PoiListCell
        // set the text from the data model
        cell.configureCell(poiList: poilist[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mapViewController = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        mapViewController.poilist = poilist[indexPath.row]
        self.present(mapViewController, animated:true, completion:nil)
    }
}

extension ViewController: DataModelDelegate {
    func didRecieveDataUpdate(data: [PoiList]) {
        self.poilist = data
        DispatchQueue.main.async {
            self.offerListTableView.reloadData()
        }
    }
}

