//
//  MainViewController.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 03/12/24.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let navigateButton = UIButton(type: .system)
        navigateButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        navigateButton.setTitle("Registro de usuarios", for: .normal)
        navigateButton.addTarget(self, action: #selector(navigateToUserRegistration), for: .touchUpInside)

        navigateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navigateButton)

        NSLayoutConstraint.activate([
            navigateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func navigateToUserRegistration() {
        let userRegistrationModule = UserRegistrationBuilder.build()
        navigationController?.pushViewController(userRegistrationModule, animated: true)
    }
}
