//
//  GeoHuntViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/20/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit
import MapKit

class GeoHuntViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
        setUpMap()
    }
    
    func setUpMap(){
        let latitude: CLLocationDegrees = 25.7020076
        let longitude: CLLocationDegrees = -80.1744671
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
    }

}
