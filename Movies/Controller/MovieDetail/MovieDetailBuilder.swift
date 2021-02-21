//
//  MovieDetailBuilder.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import UIKit

class MovieDetailBuilder {
    
    static func make(with viewModel: MovieDetailViewModelProtocol) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
}
