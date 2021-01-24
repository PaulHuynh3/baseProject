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
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleTap))
            gestureRecognizer.delegate = self
            mapView.addGestureRecognizer(gestureRecognizer)
    }

    private var userLocalityCallback: ((String) -> Void?)?
    private var locationManager: CLLocationManager?
    private var coordinate2D: CLLocationCoordinate2D?

    func configure(data: Data) {
        userLocalityCallback = data.userLocalityCallback
        setup()
    }

    @IBAction func applyLocationTapped(_ sender: Any) {
        guard let coordinate = coordinate2D else { return }
        geocodeLocation(mLattitude: coordinate.latitude, mLongitude: coordinate.longitude)
    }

    @objc func handleTap(gestureRecognizer: UILongPressGestureRecognizer) {
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)

        coordinate2D = annotation.coordinate
    }

    private func setup() {
        locationManager?.requestAlwaysAuthorization()
        locationManager = CLLocationManager()
        mapView.delegate = self
        locationManager?.delegate = self
        determineLocation()
    }

    private func determineLocation() {
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

        coordinate2D = mUserLocation.coordinate
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
