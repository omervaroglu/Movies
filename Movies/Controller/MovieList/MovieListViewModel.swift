//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation

final class  MovieListViewModel: MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?
    private let service: MoviesServiceProtocol
    private var movie: Movie?

    init(service: MoviesServiceProtocol) {
        self.service = service
    }
    
    func loadDatas() {
        notify(.titleUpdate("Movies"))
        
        service.fetchTopMovies { [weak self] (movie, error) in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.movie = movie
            self.notify(.showMovie(movie?.results ?? [] ))
        }
    }
    
    func selectItem(at index: Int) {
        //TODO: Implement.
    }
    
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
