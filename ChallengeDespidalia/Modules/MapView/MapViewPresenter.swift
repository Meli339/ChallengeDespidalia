//
//  MapViewPresenter.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 06/12/24.
//

protocol MapViewPresenterProtocol: AnyObject {
    func saveCoordinate(latitude: Double, longitude: Double)
    func loadCoordinates()
    
}

class MapViewPresenter: MapViewPresenterProtocol {
    weak var view: MapViewControllerProtocol?
    var interactor: MapViewInteractorProtocol?
    var router: MapViewRouterProtocol?

    func saveCoordinate(latitude: Double, longitude: Double) {
        let coordinate = Coordinate(latitude: latitude, longitude: longitude)
        interactor?.saveCoordinates(coordinate)
    }

    func loadCoordinates() {
        interactor?.fetchCoordinates { [weak self] coordinates in
            self?.view?.displayCoordinatesOnMap(coordinates)
        }
    }
    
    func showCoordinatesDetail() {
        router?.navigateToCoordinatesDetail(from: view!)
        }
}
