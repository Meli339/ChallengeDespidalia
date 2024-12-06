//
//  MapViewController.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 05/12/24.
//

import UIKit
import Firebase
import MapKit

protocol MapViewControllerProtocol: AnyObject {
    func displayCoordinatesOnMap(_ coordinates: [Coordinate])
}

class MapViewController: UIViewController, MapViewControllerProtocol {
    var presenter: MapViewPresenterProtocol?
    private var mapView: MKMapView!

    func displayCoordinatesOnMap(_ coordinates: [Coordinate]) {
            // Limpia las anotaciones existentes
            mapView.removeAnnotations(mapView.annotations)
            
            // Lógica para mostrar las coordenadas en el mapa
            for coordinate in coordinates {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
                mapView.addAnnotation(annotation)
            }
            
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Localización"
        mapView = MKMapView()
        setupUI()
    }
    
    // Configuración del mapa
    private func setupUI() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
