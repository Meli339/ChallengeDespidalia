//
//  MovieDetailViewController.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 05/12/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    private let overviewLabel = UILabel()
    private let titleLabel = UILabel()
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    var movie: Movie? {
        didSet {
            updateUI()
        }
    }
    // Inicializador que acepta un Movie
        init(movie: Movie) {
            self.movie = movie
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
          view.addSubview(scrollView)
          scrollView.addSubview(contentView)

          // Configuración de titleLabel
          titleLabel.font = .boldSystemFont(ofSize: 20)
          titleLabel.textAlignment = .center
          titleLabel.numberOfLines = 0
          titleLabel.translatesAutoresizingMaskIntoConstraints = false

          // Configuración de overviewLabel
          overviewLabel.numberOfLines = 0
          overviewLabel.font = .systemFont(ofSize: 16)
          overviewLabel.textAlignment = .justified
          overviewLabel.translatesAutoresizingMaskIntoConstraints = false

          contentView.addSubview(titleLabel)
          contentView.addSubview(overviewLabel)

          // Configurar restricciones para scrollView
          scrollView.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
              scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
          ])

          // Configurar restricciones para contentView
          contentView.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
              contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
              contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
              contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
              contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
          ])

          // Configurar restricciones para titleLabel
          NSLayoutConstraint.activate([
              titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
              titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
              titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
          ])

          // Configurar restricciones para overviewLabel
          NSLayoutConstraint.activate([
              overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
              overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
              overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
              overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
          ])
      }
    
    

    private func updateUI() {
        if let movie = movie {
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
        }
    }
}

