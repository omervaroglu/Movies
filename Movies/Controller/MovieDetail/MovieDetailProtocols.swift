//
//  MovieDetailProtocols.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieDetailViewModelDelegate: class {
    func showDetail(_ movie: Event<ControlEvent<Result>.Element>)
}

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}
