//
//  MapViewInteractor.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 06/12/24.
//
import Firebase

protocol MapViewInteractorProtocol: AnyObject {
    func saveCoordinates(_ coordinate: Coordinate)
    func fetchCoordinates(completion: @escaping ([Coordinate]) -> Void)
}

class MapViewInteractor: MapViewInteractorProtocol {
    private let databaseReference = Database.database().reference()

    func saveCoordinates(_ coordinate: Coordinate) {
        let coordinateData: [String: Double] = ["latitude": coordinate.latitude, "longitude": coordinate.longitude]
        databaseReference.child("coordinates").childByAutoId().setValue(coordinateData) { error, _ in
            if let error = error {
                print("Error saving coordinates: \(error.localizedDescription)")
            } else {
                print("Coordinates saved successfully")
            }
        }
    }

    func fetchCoordinates(completion: @escaping ([Coordinate]) -> Void) {
        databaseReference.child("coordinates").observeSingleEvent(of: .value) { snapshot in
            var coordinates: [Coordinate] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let value = snapshot.value as? [String: Double],
                   let latitude = value["latitude"],
                   let longitude = value["longitude"] {
                    let coordinate = Coordinate(latitude: latitude, longitude: longitude)
                    coordinates.append(coordinate)
                }
            }
            completion(coordinates)
        }
    }
}
