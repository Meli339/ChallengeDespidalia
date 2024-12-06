//
//  MovieCatalogInteractor.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 04/12/24.
//

import Foundation

protocol MovieCatalogInteractorProtocol {
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
}

class MovieCatalogInteractor: MovieCatalogInteractorProtocol {
    private let apiService: MovieAPIService

    init(apiService: MovieAPIService) {
        self.apiService = apiService
    }

    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        apiService.fetchMovies(completion: completion)
    }
}
