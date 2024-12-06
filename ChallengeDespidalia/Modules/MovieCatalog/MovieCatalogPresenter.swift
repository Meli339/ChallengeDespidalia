//
//  MovieCatalogPresenter.swift
//  ChallengeDespidalia
//
//  Created by Melina Ramos on 04/12/24.
//

protocol MovieCatalogPresenterProtocol {
    func viewDidLoad()
    func didSelectMovie(at index: Int)
    func didTapNavigateButton()
}

class MovieCatalogPresenter: MovieCatalogPresenterProtocol {
    weak var view: MovieCatalogViewProtocol?
    private let interactor: MovieCatalogInteractorProtocol
    private let router: MovieCatalogRouterProtocol

    private var movies: [Movie] = []

    init(view: MovieCatalogViewProtocol?, interactor: MovieCatalogInteractorProtocol, router: MovieCatalogRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor.fetchMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.view?.displayMovies(movies)
            case .failure(let error):
                self?.view?.showError(error.localizedDescription)
            }
        }
    }

    func didSelectMovie(at index: Int) {
        let selectedMovie = movies[index]
        router.navigateToMovieDetail(movie: selectedMovie)
    }
    
    func didTapNavigateButton() {
            router.navigateToMap()
        }
}
