//
//  MovieListBuilder.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import UIKit

class MovieListBuilder {
    
    static func make() -> MovieListViewController {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        viewController.viewModel = MovieListViewModel(service: AppContainer.shared.service)
        return viewController
    }
    
}
