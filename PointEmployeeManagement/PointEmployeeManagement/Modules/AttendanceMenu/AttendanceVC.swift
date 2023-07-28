//
//  AttendanceVC.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 29/07/23.
//

import UIKit
import MapKit
import CoreLocation

class AttendanceVC: UIViewController {
    @IBOutlet weak var mapLocation: MKMapView!
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var btnPresence: RoundedCornerButton!
    
    var presenter: VTPAttendanceProtocol?
    var data = AttendanceModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setTitle("Attendance")
        btnPresence.setTitle("Presensi", for: .normal)
        btnPresence.addTarget(self, action: #selector(onCLickPresense), for: .touchUpInside)
    }
    
    @objc func onCLickPresense(){
        if let navigation = navigationController {
            presenter?.presence(data: data, nav: navigation)
        }
    }



}

extension AttendanceVC: CLLocationManagerDelegate, MKMapViewDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.stopUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let lat: CLLocationDegrees = -7.6647
            let long: CLLocationDegrees = 110.4144
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            let regionRadius: CLLocationDistance = 100 // The desired radius around the user's location in meters
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapLocation.setRegion(region, animated: true)
            CLGeocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                if let error = error {
                        print("Reverse geocoding failed with error: \(error.localizedDescription)")
                        return
                }
                
                if let placemark = placemarks?.first {
                    let streetName = placemark.thoroughfare ?? ""
                }
            }
        }
        
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
}

extension AttendanceVC: PTVAttendanceProtocol{
    
}
