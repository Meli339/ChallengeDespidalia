//
//  MapViewBuilder.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 06/12/24.
//

class MapViewBuilder {
    
    static func build() -> MapViewController {
    
        let interactor = MapViewInteractor()
        let presenter = MapViewPresenter()
        let router = MapViewRouter()
        let viewController = MapViewController()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
    
        viewController.presenter = presenter
        
        return viewController
    }
}
