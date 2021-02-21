//
//  AppContainer.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//
// for application dependency

import Foundation

final class AppContainer {
    
    public static var shared = AppContainer()
    
    let router = AppRouter()
    let service = MoviesService()
}
