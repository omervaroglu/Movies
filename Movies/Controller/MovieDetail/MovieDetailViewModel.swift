//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    weak var delegate: MovieDetailViewModelDelegate?
    private let movie: Result?
    
    init(movie: Result?) {
        self.movie = movie
    }
    
    func load() {
        delegate?.showDetail(movie)
    }
}
