//
//  UserRegistrationBuilder.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 03/12/24.
//

import UIKit

class UserRegistrationBuilder {
    static func build() -> UIViewController {
        let view = UserRegistrationViewController()
        let presenter = UserRegistrationPresenter()
        let interactor = UserRegistrationInteractor()
        let router = UserRegistrationRouter()
        
       
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
