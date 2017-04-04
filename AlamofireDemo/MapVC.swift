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

    let OpenWeatherAPIKey = "e9ab0d5d52d2ecb19389c7bea4af3d13"
    
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
        
        let url = "http://api.openweathermap.org/data/2.5/weather?lat=(coordinates.latitude)&lon=(coordinates.longitude)&APIKEY=(OpenWeatherAPIKey)&units=metric"
        
        Alamofire.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
//                let json = JSON(data)
                print("data: \(data)")

//                DispatchQueue.main.async {
//                    if let locationName:String = data["name"] as? String{
//                        annotation.title = locationName
//                        
//                    }
//                    
//                    if let main:[NSObject:AnyObject] = data["main"] as? [NSObject:AnyObject]{
//                        
//                        if let temperature = main["temp"]{
//                            
//                            annotation.subtitle = "(temperature) ℃"
//                            
//                            self.mapView.selectAnnotation(annotation, animated: true)
//                        }
//                    }
//                }
                
            case .failure(let error):
                print(error)
            }
        }
    }

}
