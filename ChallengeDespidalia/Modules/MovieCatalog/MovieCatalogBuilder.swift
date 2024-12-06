//
//  MovieCatalogBuilder.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 05/12/24.
//

import UIKit

class MovieCatalogBuilder {
    static func build() -> UIViewController {
        
        let apiService = MovieAPIService()
        let interactor = MovieCatalogInteractor(apiService: apiService)
        let view = MovieCatalogViewController(presenter: nil, router: nil)
        let router = MovieCatalogRouter(viewController: view)
        let presenter = MovieCatalogPresenter(view: view, interactor: interactor, router: router)
        view.presenter? = presenter
        view.router? = router
        return view
    }
}
