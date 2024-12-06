//
//  ViewController.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 03/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
           super.viewDidLoad()
           
           // Configurar la vista
           view.backgroundColor = .white
           
           // Añadir componentes de UI
           let label = UILabel()
           label.text = "Hola, Mundo!"
           label.textColor = .black
           label.textAlignment = .center
           label.translatesAutoresizingMaskIntoConstraints = false
           
           view.addSubview(label)
           
           // Configurar restricciones
           NSLayoutConstraint.activate([
               label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           ])
       }


}

