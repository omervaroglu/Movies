//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieDecription: UILabel!
    
    var viewModel: MovieDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
}
extension MovieDetailViewController: MovieDetailViewModelDelegate {
    
    func showDetail(_ movie: Result?) {
        self.movieDecription.text = movie?.overview
        setImg(image: movieImageView, imgLink: Constants.shared.imagePath + (movie?.posterPath ?? ""))
    }

}
