//
//  ViewController.swift
//  Perdido
//
//  Created by Student on 2/2/16.
//  Copyright © 2016 Perdido S.A. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

class MapViewController: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mpview: MKMapView!
    
    var mLocationManager = CLLocationManager()
    
    @IBAction func CentralizarButton(sender: AnyObject) {
        locationManager(mLocationManager, didUpdateLocations: [mLocationManager.location!])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mLocationManager.delegate = self
        mLocationManager.requestWhenInUseAuthorization() // requisita somente com o aplicativo em uso - não usa em background
        
        
        // TODO:
        // Rodar algoritmo que list todos os PINS que representam sugestoes
        
        let point = MKPointAnnotation()
        //point.coordinate = CLLocationCoordinate2DMake(-22.980198, -43.233674)//cria uma coordenada
        point.coordinate = (mLocationManager.location?.coordinate)!
        
        point.title = "HackaTruck"
        point.subtitle = "Perto de você"
        
        mpview.addAnnotation(point)
        mpview.showAnnotations([point], animated: false)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse{
            mpview.showsUserLocation = true
            
            if let location = mLocationManager.location?.coordinate{
                mpview.setCenterCoordinate(location, animated: true)
                // centraliza o mapa na localização do usuário
            } else {
                mLocationManager.startUpdatingLocation()
                // caso a localizacao do usuario nao exista estaremos procurando pela localizacao atravez desse metodo chama outro o DidUpdateLocation em seguida
            }
            
        }
    }
    
    func locationManager(manager: CLLocationManager,didUpdateLocations locations: [CLLocation]) {
        mLocationManager.stopUpdatingLocation()
        if let location = locations.last{
            mpview.setCenterCoordinate(location.coordinate, animated: true)
            mpview.camera.altitude = pow(2, 11)
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "ActualAnnotation" // criamos um identificador unico
        
        if annotation.isKindOfClass(MKUserLocation){
            return nil
        }
        
        if annotation.isKindOfClass(MKPointAnnotation){
            //Verificamos se a classe pertence a um point annotation, se isso for verdade criamos uma nova notacao
            
            var pin = mpview.dequeueReusableAnnotationViewWithIdentifier(identifier) as! MKPinAnnotationView!
            if pin == nil{
                pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                pin.image = UIImage(named: "red_pin")
                pin.centerOffset = CGPointMake(0, -10)
                pin.canShowCallout = true // inserimos um balao de info
                
                //callout
                
                let button = UIButton(type: .DetailDisclosure)
                pin!.leftCalloutAccessoryView = button // do lado esquerdo colocamos um botao
                
                let image = UIImageView(image: UIImage(named: "item_check")!)
                pin!.rightCalloutAccessoryView = image
                
            } else {
                pin!.annotation = annotation
            }
            return pin
        }
        return nil
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control is UIButton{
            let alert = UIAlertController(title: "Bom Restaurante", message: "Bem Vindo", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "Obrigado", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
}

