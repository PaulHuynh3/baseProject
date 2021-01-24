//
//  LocationTableViewCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-23.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class LocationTableViewCell: UITableViewCell, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    private var userLocalityCallback: ((String) -> Void?)?
    private var locationManager: CLLocationManager?
    private var currentLocation: CLLocation?

    func configure(data: Data) {
        userLocalityCallback = data.userLocalityCallback
        setup()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error - locationManager: \(error.localizedDescription)")
    }

    private func setup() {
        locationManager?.requestAlwaysAuthorization()
        locationManager = CLLocationManager()
        mapView.delegate = self
        locationManager?.delegate = self
        determineLocation()
    }

    @IBAction func applyLocationTapped(_ sender: Any) {
        guard let location = currentLocation else { return }
        geocodeLocation(mLattitude: location.coordinate.latitude, mLongitude: location.coordinate.longitude)
    }

    fileprivate func determineLocation() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
//                showLocationDisabledPopUp()
                //TODO: Need to refresh the cell after location access is given
                locationManager?.requestAlwaysAuthorization()
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
                locationManager?.startUpdatingLocation()
            @unknown default:
                fatalError()
            }
        } else {
            print("Location services are not enabled")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let mUserLocation = locations[0]
        let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(mRegion, animated: true)

    let mkAnnotation: MKPointAnnotation = MKPointAnnotation()
        mkAnnotation.coordinate = CLLocationCoordinate2DMake(mUserLocation.coordinate.latitude, mUserLocation.coordinate.longitude)
        mkAnnotation.title = "Current location"
        mapView.addAnnotation(mkAnnotation)

        currentLocation = mUserLocation
    }

    private func geocodeLocation(mLattitude: CLLocationDegrees, mLongitude: CLLocationDegrees) {
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: mLattitude, longitude: mLongitude)

        geoCoder.reverseGeocodeLocation(location) { placemarks, error -> Void in
            guard let mPlacemark = placemarks else { return }

            if let postalCode = mPlacemark[0].postalCode {
                self.userLocalityCallback?(postalCode)
            } else if let locality = mPlacemark[0].locality {
                self.userLocalityCallback?(locality)
            }
        }
    }
}

extension LocationTableViewCell {
    struct Data {
        var userLocalityCallback: ((String) -> Void?)
    }
}
