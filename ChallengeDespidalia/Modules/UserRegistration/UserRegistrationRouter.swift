//
//  UserRegistrationRouter.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 03/12/24.
//

import UIKit

protocol UserRegistrationRouterProtocol: AnyObject {
    func navigateToNextScreen()
}

class UserRegistrationRouter: UserRegistrationRouterProtocol {
    weak var viewController: UIViewController?
    
    
    func navigateToNextScreen() {
        let movieCatalogViewController = MovieCatalogRouter.createModule()
        viewController?.navigationController?.pushViewController(movieCatalogViewController, animated: true)
    }
}

