//
//  MovieCatalogTableViewCell.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 05/12/24.
//

import Kingfisher

class MovieCatalogTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let posterImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        titleLabel.numberOfLines = 1
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center

        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true

        let stackView = UIStackView(arrangedSubviews: [posterImageView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            posterImageView.widthAnchor.constraint(equalToConstant: 100),
            posterImageView.heightAnchor.constraint(equalToConstant: 150), 
            titleLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    func configure(with movie: Movie) {
        titleLabel.text = movie.title

        // Cargar la imagen del póster con Kingfisher
        let posterURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
        posterImageView.kf.setImage(with: posterURL)
    }
}
