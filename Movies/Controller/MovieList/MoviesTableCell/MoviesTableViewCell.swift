//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import UIKit

class MoviesTableViewCell: UITableViewCell, ClassNameGettable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    public func configureCell(movie: Result) {
        self.titleLabel.text = movie.name
        self.ratingLabel.text = movie.voteAverage?.double
    }
}
