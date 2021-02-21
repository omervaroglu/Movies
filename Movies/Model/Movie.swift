//
//  Movie.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let page: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case page, results
    }
}

// MARK: - Result
struct Result: Codable {
    let backdropPath: String?
    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?
    
    init(backdropPath: String, id: Int, name: String, overview: String, posterPath: String, voteAverage: Double) {
        self.backdropPath = backdropPath
        self.id = id
        self.name = name
        self.overview = overview
        self.posterPath = posterPath
        self.voteAverage = voteAverage
    }

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, name
        case posterPath = "poster_path"
        case overview
        case voteAverage = "vote_average"
    }
}
