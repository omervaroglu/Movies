//
//  MovieDetailProtocols.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation

protocol MovieDetailViewModelDelegate: class {
    func showDetail(_ movie: Result?)
}

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}
