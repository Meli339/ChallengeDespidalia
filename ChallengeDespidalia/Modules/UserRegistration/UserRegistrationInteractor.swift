//
//  UserRegistrationInteractor.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 03/12/24.
//

import Foundation
import UIKit

protocol UserRegistrationInteractorProtocol: AnyObject {
    func validateName(_ name: String) -> Bool
}

protocol UserRegistrationInteractorOutputProtocol: AnyObject {
    func showAlert(title: String, message: String)


}

class UserRegistrationInteractor: UserRegistrationInteractorProtocol {
    weak var output: UserRegistrationInteractorOutputProtocol?
    
    func validateName(_ name: String) -> Bool {
        let nameRegEx = "^[A-Za-z]+$"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return nameTest.evaluate(with: name)
    }
    
}
