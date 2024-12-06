//
//  MovieCatalogRouter.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 04/12/24.
//

import Foundation
import UIKit

protocol MovieCatalogRouterProtocol {
    func navigateToMovieDetail(movie: Movie)
    func navigateToMap()
}

class MovieCatalogRouter: MovieCatalogRouterProtocol {
    weak var viewController: UIViewController?
    init(viewController: UIViewController) {
            self.viewController = viewController
    }
    static func createModule() -> UIViewController {
        let apiService = MovieAPIService()
          let interactor = MovieCatalogInteractor(apiService: apiService)
        let view = MovieCatalogViewController(presenter: nil, router: nil)
          let router = MovieCatalogRouter(viewController: view)
          let presenter = MovieCatalogPresenter(view: view, interactor: interactor, router: router) 

          // Configurar las dependencias
          view.presenter = presenter
          router.viewController = view

          return view
    }
    
    func navigateToMovieDetail(movie: Movie) {
        let detailViewController = MovieDetailViewController(movie: movie)
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func navigateToMap() {
            let mapViewController = MapViewController()
            viewController?.navigationController?.pushViewController(mapViewController, animated: true)
        }
}
