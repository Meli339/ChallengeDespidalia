//
//  MapViewRouter.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 06/12/24.
//

protocol MapViewRouterProtocol: AnyObject {
    func navigateToCoordinatesDetail(from view: MapViewControllerProtocol)
}

class MapViewRouter: MapViewRouterProtocol {
    func navigateToCoordinatesDetail(from view: MapViewControllerProtocol) {
        let mapViewController = MapViewBuilder.build()
        if let sourceView = view as? MapViewController{
            sourceView.navigationController?.pushViewController(mapViewController, animated: true)
        }
    }
}


