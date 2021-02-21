//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import UIKit

class MoviesTableViewCell: UITableViewCell, ClassNameGettable {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureCell(movie: Result) {
        self.containerView.configureBorderedContainer()
        self.titleLabel.text = movie.name
        self.ratingLabel.text = movie.voteAverage?.double
    }
}
