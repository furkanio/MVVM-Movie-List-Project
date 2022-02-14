//
//  MovieDetailViewModel.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import UIKit

class MovieDetailViewModel: NSObject {
    var movieDetailCompletion: ((_ path: String,_ title: String)->())?
    var movieId: Int?
    
    
    
    var movieDetail: MovieDetail!{
        didSet{
            guard let movieDetailCompletion = self.movieDetailCompletion else {return}
            let imagePath = movieDetail.poster_path ?? ""
            let title = movieDetail.title ?? ""
            movieDetailCompletion(imagePath,title)
        }
    }
    
    init(movieId: Int?) {
        super.init()
        self.movieId = movieId
        self.fetchMovieDetail()
    }
    
    private func fetchMovieDetail(){
        APIService.shared.fetchMovieDetail(movieId: movieId) { (movieDetail, error) in
            
            if error == nil {
                self.movieDetail = movieDetail

            } else {
                
            }
            
        }
    }

}
