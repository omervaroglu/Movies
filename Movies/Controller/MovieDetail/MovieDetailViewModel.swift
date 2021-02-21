//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation
import RxSwift
import RxCocoa

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    weak var delegate: MovieDetailViewModelDelegate?
    private let movie: Event<ControlEvent<Result>.Element>
    
    init(movie: Event<ControlEvent<Result>.Element>) {
        self.movie = movie
    }
    
    func load() {
        delegate?.showDetail(movie)
    }
}
