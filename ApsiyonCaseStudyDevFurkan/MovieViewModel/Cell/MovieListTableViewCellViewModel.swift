//
//  MovieListTableViewCellViewModel.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import Foundation
class MovieListTableViewCellViewModel{
    
    var dataSettedCompletion: ((_ url: String, _ title: String, _ date: String,_ vote: Double)->())?
    var dataSource: Movie?{
        didSet{
            guard let dataSettedCompletion = dataSettedCompletion else {return}
            let url = self.dataSource?.backdrop_path ?? ""
            let title = self.dataSource?.title ?? ""
            let date = self.dataSource?.release_date ?? ""
            let vote = self.dataSource?.vote_average ?? 1
            dataSettedCompletion(url, title, date, vote)
        }
    }
    
}
