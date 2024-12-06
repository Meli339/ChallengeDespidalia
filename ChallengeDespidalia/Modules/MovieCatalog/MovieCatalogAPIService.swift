//
//  MovieCatalogAPIService.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 05/12/24.
//

import Foundation

class MovieAPIService {
    private let baseURL = "https://api.themoviedb.org/3"
    private let apiKey = "bfb0c907cadfb9310df03fd858aeee43"

    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/movie/popular?api_key=\(apiKey)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }

            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(movieResponse.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
