//
//  UserRegistrationSelfieCell.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 03/12/24.
//


import UIKit

class UserRegistrationSelfieCell: UITableViewCell {
    private let cameraIcon = UIImageView()
    private let selfieLabel = UILabel()
    private let containerStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        // Configurar el ícono de cámara
        cameraIcon.translatesAutoresizingMaskIntoConstraints = false
        cameraIcon.image = UIImage(systemName: "camera.fill")
        cameraIcon.tintColor = .systemBlue
        cameraIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        cameraIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
      
        
        // Configurar el label
        selfieLabel.translatesAutoresizingMaskIntoConstraints = false
        selfieLabel.text = "Tomar selfie"
        selfieLabel.font = UIFont.systemFont(ofSize: 17)
        selfieLabel.textColor = .systemGray3
        selfieLabel.textAlignment = .left
        
        // Configurar el stack view
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .horizontal
        containerStackView.spacing = 8
        containerStackView.alignment = .center
        containerStackView.addArrangedSubview(cameraIcon)
        containerStackView.addArrangedSubview(selfieLabel)
        contentView.addSubview(containerStackView)
        
        // Configurar restricciones del stack view
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            containerStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16)
        ])
        
    }
    
    
    func configure() {
        // Configuraciones adicionales
    }
}
