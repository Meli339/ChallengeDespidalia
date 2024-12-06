//
//  UserRegistrationPresenter.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 03/12/24.
//

import Foundation
import UIKit

protocol UserRegistrationPresenterProtocol: AnyObject {
    func viewDidLoad()
    func numberOfRows() -> Int
    func getNameCellData() -> String
    func navigateToNextScreen()
}

class UserRegistrationPresenter: UserRegistrationPresenterProtocol {
        
    func navigateToNextScreen() {
        // Lógica para navegar a la siguiente pantalla
        router?.navigateToNextScreen()
    }
    weak var view: UserRegistrationViewProtocol?
    var interactor: UserRegistrationInteractorProtocol?
    var router: UserRegistrationRouterProtocol?
    
    private var name: String = ""
    
    func viewDidLoad() {
        view?.reloadTableView()
    }
    
    func numberOfRows() -> Int {
        return 2
    }
    
    func getNameCellData() -> String {
        return name
    }
    
    
}

