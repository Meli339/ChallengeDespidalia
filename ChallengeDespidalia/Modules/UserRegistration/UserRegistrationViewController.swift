//
//  UserRegistrationViewController.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 03/12/24.
//

import UIKit

protocol UserRegistrationViewProtocol: AnyObject {
    func reloadTableView()
}

class UserRegistrationViewController: UIViewController, UserRegistrationViewProtocol {
    
    var presenter: UserRegistrationPresenter?
    var router: UserRegistrationRouter?
    //Etiqueta titulo de la pantalla
    private var titleLabel = UILabel()
    private var nameTextField = UITextField()
    private let previewImageView = UIImageView()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if router == nil {
            router = UserRegistrationRouter()
        }
        if presenter == nil {
            presenter = UserRegistrationPresenter()
        }
        router?.viewController = self
        presenter?.view = self
        presenter?.router = router
        presenter?.interactor = UserRegistrationInteractor()
        
        
        // Configurar el fondo de la vista
        view.backgroundColor = UIColor.white
        setupUI()
   
    }
    
    func setupUI() {
        // Añadir componentes a la vista
        view.addSubview(titleLabel)
        view.addSubview(previewImageView)
        view.addSubview(tableView)
        
        
        // Configurar restricciones para el titulo
        
        titleLabel.text = "Registro de usuarios"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
           
        // Configurar el previewImageView
        previewImageView.translatesAutoresizingMaskIntoConstraints = false
        previewImageView.contentMode = .scaleAspectFill
        previewImageView.layer.cornerRadius = 10
        previewImageView.clipsToBounds = true
        previewImageView.backgroundColor = .systemGray6
        previewImageView.translatesAutoresizingMaskIntoConstraints = false
        previewImageView.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            previewImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            previewImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            previewImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            previewImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Configurar restricciones para la tabla
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UserRegistrationNameCell.self, forCellReuseIdentifier: "NameCell")
        tableView.register(UserRegistrationSelfieCell.self, forCellReuseIdentifier: "SelfieCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 60
       
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? UserRegistrationNameCell {
                cell.nameUpdated = { [weak self] name in
                    self?.nameTextField.text = name
                }
            }
        
        // Configurar el botón de navegación
        
        let navigateButton = UIButton(type: .system)
        navigateButton.setTitle("Siguiente", for: .normal)
        navigateButton.translatesAutoresizingMaskIntoConstraints = false
        navigateButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(navigateButton)
        
        NSLayoutConstraint.activate([
               navigateButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
               navigateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               navigateButton.heightAnchor.constraint(equalToConstant: 44),
               navigateButton.widthAnchor.constraint(equalToConstant: 200)
           ])
        view.addSubview(navigateButton)
        navigateButton.addTarget(self, action: #selector(navigateButtonTapped), for: .touchUpInside)
    }
    
    // Método para actualizar la imagen del preview
    func updatePreviewImage(with image: UIImage) {
        previewImageView.image = image
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func showSelfieOptions(hasExistingSelfie: Bool) {
        let alert = UIAlertController(title: "Selfie", message: "Elige una opción", preferredStyle: .actionSheet)
        
        if hasExistingSelfie {
            alert.addAction(UIAlertAction(title: "Visualizar selfie", style: .default) { _ in
                self.displaySelfie()
            })
        }
        
        alert.addAction(UIAlertAction(title: "Tomar/Seleccionar selfie", style: .default) { _ in
            self.openCameraOrPhotoLibrary()
        })
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func displaySelfie() {
        showAlert(title: "Selfie", message: "Aquí se muestra la selfie existente")
    }

    private func openCameraOrPhotoLibrary() {
        let alert = UIAlertController(title: "Seleccionar selfie", message: "Elige cómo tomar la selfie", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Tomar foto", style: .default) { _ in
            self.presentImagePickerController(sourceType: .camera)
        })
        
        alert.addAction(UIAlertAction(title: "Seleccionar de la galería", style: .default) { _ in
            self.presentImagePickerController(sourceType: .photoLibrary)
        })
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func navigateButtonTapped() {
            guard let presenter = presenter else { return }
                presenter.navigateToNextScreen()
    }
    
}


extension UserRegistrationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as? UserRegistrationNameCell else {
                return UITableViewCell()
            }
            cell.configure(with: presenter!.getNameCellData())
            cell.nameUpdated = { [weak self] name in
                guard let self = self else { return }
                if let presenter = self.presenter {
                  
                }
            }
            return cell
            
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelfieCell", for: indexPath) as? UserRegistrationSelfieCell else {
                return UITableViewCell()
            }
            cell.configure()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

extension UserRegistrationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            // Aquí se llama al método de la extensión para presentar el image picker
            showImagePickerOptions()
        }
    }
}

extension UserRegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // Método para presentar el UIImagePickerController
    func presentImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = sourceType
        imagePickerController.allowsEditing = false
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // Delegado para manejar la imagen seleccionada o tomada
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                // Actualiza el preview con la imagen seleccionada
                updatePreviewImage(with: image)
            }
            picker.dismiss(animated: true, completion: nil)
        }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    // Método para mostrar opciones de selección de imagen
    func showImagePickerOptions() {
        let alertController = UIAlertController(title: "Selfie", message: "¿Quieres tomar una foto o seleccionar de la galería?", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: { _ in
            self.presentImagePickerController(sourceType: .camera)
        }))
        
        alertController.addAction(UIAlertAction(title: "Seleccionar de la galería", style: .default, handler: { _ in
            self.presentImagePickerController(sourceType: .photoLibrary)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
}

extension UserRegistrationViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
