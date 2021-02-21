//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation
import RxCocoa
import RxSwift

final class  MovieListViewModel: MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?
    private let service: MoviesServiceProtocol
    
    var movies = BehaviorRelay<[Result]>(value: [])

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
            self.movies.accept(movie?.results ?? [])
            self.notify(.showMovie)
        }
    }
    
    func selectItem(at item: Event<ControlEvent<Result>.Element>) {
        let movie = item
        let viewModel = MovieDetailViewModel(movie: movie)
        delegate?.navigate(to: .detail(viewModel))
    }
    
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
