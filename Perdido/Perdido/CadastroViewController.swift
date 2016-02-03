//
//  CadastroViewController.swift
//  Perdido
//
//  Created by Student on 2/2/16.
//  Copyright © 2016 Perdido S.A. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

class CadastroViewController: UIViewController , CLLocationManagerDelegate,{
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtLatitude: UITextField!
    @IBOutlet weak var txtLongitude: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    var mLocationManager = CLLocationManager()
    
    var sugestao: Sugestao? = nil
    
    
    override func viewDidLoad() {
        
        mLocationManager.delegate = self
        mLocationManager.requestWhenInUseAuthorization() // requisita somente com o aplicativo em uso - não usa em background
    }
    
    @IBAction func takePhoto(sender: UIButton) {
    }
    
//    
//    func locationManager(manager: CLLocationManager,didUpdateLocations locations: [CLLocation]) {
//        mLocationManager.stopUpdatingLocation()
//        if let location = locations.last{
//            mpview.setCenterCoordinate(location.coordinate, animated: true)
//            mpview.camera.altitude = pow(2, 11)
//        }
//    }
//
    

}
