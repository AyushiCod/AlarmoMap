//
//  MapVC.swift
//  AlamofireDemo
//
//  Created by Codiant Mac  on 4/3/17.
//  Copyright © 2017 Codiant Software Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func IBActionLongpress(_ sender: UILongPressGestureRecognizer) {
        handleLongPress(gestureRecognizer: sender)
    }
    
    func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer){
        
        if gestureRecognizer.state == UIGestureRecognizerState.began{
            
            let touchPoint = gestureRecognizer.location(in: mapView)
            let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            addAnnotationOnLocation(coordinates: newCoordinates)
        }
    }
    
    func addAnnotationOnLocation(coordinates:CLLocationCoordinate2D){
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinates
        
        annotation.title = "Loading…"
        
        annotation.subtitle = "Loading…"
        
        mapView.addAnnotation(annotation)
        
        }
}
