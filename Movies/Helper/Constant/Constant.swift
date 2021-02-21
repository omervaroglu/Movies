//
//  Constant.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation

public class Constants: NSObject {
    
    static let shared = Constants()
    
    let baseUrl = "https://api.themoviedb.org/3/tv/popular"
    let imagePath = "https://image.tmdb.org/t/p/w500"

    let apiKey = "f7dea668cf80a25035af6e29f6e05c5e"
}
