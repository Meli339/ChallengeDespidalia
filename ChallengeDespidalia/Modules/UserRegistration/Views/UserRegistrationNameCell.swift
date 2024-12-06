//
//  UserRegistrationNameCell.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 03/12/24.
//

import UIKit

class UserRegistrationNameCell: UITableViewCell {
    private let textField = UITextField()
    var nameUpdated: ((String) -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        contentView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        textField.placeholder = "Ingrese su nombre"
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    func configure(with name: String) {
        textField.text = name
    }
    
    @objc private func textChanged() {
  
        if let text = textField.text {
            nameUpdated?(text)
        }
    }
}

extension UserRegistrationNameCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Solo permitir caracteres alfabéticos (A-Z y a-z)
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        guard let name = textField.text else { return }
        nameUpdated?(name)
    }
}

