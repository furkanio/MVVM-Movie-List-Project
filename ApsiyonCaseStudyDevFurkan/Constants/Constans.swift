//
//  Constans.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import Foundation

class Constants{
    private init(){}
    static var shared = Constants()
    
    let endPoint: String = "https://api.themoviedb.org/3"
    let apiKeyParameter : String = "?api_key="
    let apiKey: String = "bd7847090fea4f76f5ce0c22bd1a85b8"
    let baseImageUrl : String = "https://image.tmdb.org/t/p/w500"
    let popularMovies : String = "/movie/popular"
    let movieDetail: String = "/movie/"
    let page: String = "&page="
}

