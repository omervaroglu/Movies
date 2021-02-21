//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieDecription: UILabel!
    
    var viewModel: MovieDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
        containerView.configureBorderedContainer()
    }
}
extension MovieDetailViewController: MovieDetailViewModelDelegate {
    
    func showDetail(_ movie: Event<ControlEvent<Result>.Element>) {
        self.movieDecription.text = movie.element?.overview
        setImg(image: movieImageView, imgLink: Constants.shared.imagePath + (movie.element?.posterPath ?? ""))
        self.title = movie.element?.name
    }

}
