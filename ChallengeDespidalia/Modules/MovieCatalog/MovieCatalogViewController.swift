//
//  MovieCatalogViewController.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 04/12/24.
//


import UIKit

protocol MovieCatalogViewProtocol: AnyObject {
    func displayMovies(_ movies: [Movie])
    func showError(_ error: String)
}

class MovieCatalogViewController: UIViewController, MovieCatalogViewProtocol {
    var presenter: MovieCatalogPresenterProtocol?
    var router: MovieCatalogRouterProtocol?
    var movies: [Movie] = []

    private let tableView = UITableView()
    
    init(presenter: MovieCatalogPresenterProtocol?, router: MovieCatalogRouterProtocol?) {
           self.presenter = presenter
           super.init(nibName: nil, bundle: nil)
       }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Catálogo de peliculas"
    }

    private func setupUI() {
        view.addSubview(tableView)
        
        //Configuraciones tabla
        tableView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
            ])

        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCatalogTableViewCell.self, forCellReuseIdentifier: "MovieCell")
        
        //Configuraciones botón
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
        navigateButton.addTarget(self, action: #selector(didTapNavigateButton), for: .touchUpInside)
    }
    
 

    func displayMovies(_ movies: [Movie]) {
        self.movies = movies
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showError(_ error: String) {
        // Presentar error al usuario
    }
    

    @objc private func didTapNavigateButton() {
        presenter?.didTapNavigateButton()
    }
}

extension MovieCatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCatalogTableViewCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let movie = movies[indexPath.row]
        let detailViewController = MovieDetailViewController(movie:movie)
            detailViewController.movie = movie
            navigationController?.pushViewController(detailViewController, animated: true)
        }
}
