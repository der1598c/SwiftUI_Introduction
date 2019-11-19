//
//  Movie.swift
//  MoviesApp
//
//  Created by Leyee.H on 2019/11/19.
//  Copyright © 2019 Leyee. All rights reserved.
//

import Foundation

struct MoviesResponse: Codable {
    
    let search: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

struct Movie: Codable {
    
    let title: String
    let year: String
    let imdbId: String
    let poster: String
    
    private enum CodingKeys: String,CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
    
}
