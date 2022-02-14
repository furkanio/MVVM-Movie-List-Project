//
//  Movie.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 16.12.2021.
//
//"page": 1,
//  "results": [
//    {
//      "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
//      "adult": false,
//      "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
//      "release_date": "2016-08-03",
//      "genre_ids": [
//        14,
//        28,
//        80
//      ],
//      "id": 297761,
//      "original_title": "Suicide Squad",
//      "original_language": "en",
//      "title": "Suicide Squad",
//      "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
//      "popularity": 48.261451,
//      "vote_count": 1466,
//      "video": false,
//      "vote_average": 5.91
//    }

import Foundation

struct myFav : Codable {
    
    let results : [Movie]?
    let page: Int?
    let total_results: Int?
    let dates: Dates?
    let total_pages: Int?
}

struct Movie : Codable {
    let popularity: Double?
    let vote_count: Int?
    let video: Bool?
    let poster_path: String?
    let id: Int?
    let adult: Bool?
    let backdrop_path: String?
    let original_language: String?
    let original_title: String?
    let title: String?
    let vote_average: Double?
    let release_date: String?
}

struct Dates: Codable {
    let maximum: String?
    let minimum: String?
}
