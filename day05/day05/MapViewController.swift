//
//  MapViewController.swift
//  day05
//
//  Created by Macbook Pro on 10/12/20.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let location = CLLocationManager()
    
    var dataPassed: Pin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        putPins()
        
        mapView.delegate = self
        location.delegate = self
        location.requestWhenInUseAuthorization()
    }
    
    // MARK: - Pins
    
    func putPins() {
        for pin in Pins {
            let annotation = MKPointAnnotation()
            annotation.title = pin.title
            annotation.subtitle = pin.subtitle
            annotation.coordinate = CLLocationCoordinate2D(latitude: pin.lat, longitude: pin.long)
            mapView.addAnnotation(annotation)
        }
    }
    
    func goToPin(destination: Pin) {
        location.stopUpdatingLocation()
        let coordinate = CLLocationCoordinate2D(latitude: destination.lat, longitude: destination.long)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 4000, longitudinalMeters: 4000)
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if (annotation.isEqual(mapView.userLocation)) { return nil }
        var color = UIColor.white
        
        for pin in Pins {
            if pin.lat == annotation.coordinate.latitude, pin.long == annotation.coordinate.longitude {
                color = pin.color
                break
            }
        }
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        annotationView.canShowCallout = true;
        annotationView.pinTintColor = color
        return annotationView
    }
    
    // MARK: - SegmentControlBar
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            mapView.mapType = MKMapType.standard
        } else if sender.selectedSegmentIndex == 1 {
            mapView.mapType = MKMapType.satellite
        } else if sender.selectedSegmentIndex == 2 {
            mapView.mapType = MKMapType.hybrid
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    
    @IBAction func goToMyLocation(_ sender: Any) {
        location.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegion(center: locations[0].coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
    }
    
    // MARK: - unwind Segue
    
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
        if dataPassed != nil {
            goToPin(destination: dataPassed!)
        }
    }

}
