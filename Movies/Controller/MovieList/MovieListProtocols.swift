//
//  MovieListProtocols.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation

protocol MovieListViewModelProtocol{
    var delegate: MovieListViewModelDelegate? {get set}
    
    func loadDatas()
    func selectItem(at index: Int)
}

enum MovieListViewModelOutput {
    case titleUpdate(String)
    case showMovie([Result])
}

enum MovieListViewRoute{
    case detail(MovieDetailViewModelProtocol)
}

protocol MovieListViewModelDelegate: class {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
    func navigate(to route: MovieListViewRoute)
}
