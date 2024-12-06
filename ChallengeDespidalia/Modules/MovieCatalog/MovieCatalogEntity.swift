//
//  MovieCatalogEntity.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 04/12/24.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
    }
}

