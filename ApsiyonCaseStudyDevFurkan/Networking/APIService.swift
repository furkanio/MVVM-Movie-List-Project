//
//  APIService.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import Foundation

class APIService {
    private init(){}
    static var shared = APIService()
    
    func fetchPopularMoviesData(page:Int?,completion: @escaping (_ data : myFav?, _ error: Error?)-> Void){
        guard let pageNumber = page else {return}
        let url = Constants.shared.endPoint + Constants.shared.popularMovies + Constants.shared.apiKeyParameter + Constants.shared.apiKey + Constants.shared.page + String(pageNumber)
        NetworkHandler.sendRequest(url: url) { (data, error) in
            guard let data = data?.data else {
                completion(nil, nil)
                return
            }
            do {
                let object = try JSONDecoder().decode(myFav.self, from: data)
                completion(object,nil)
                
            }catch let error {
                print(error.localizedDescription)
                completion(nil, error)
            }
        }
    }
    
    func fetchMovieDetail(movieId: Int?,completion: @escaping (_ data : MovieDetail?, _ error: Error?)-> Void){
        guard  let id = movieId else {return}

        let url = Constants.shared.endPoint + Constants.shared.movieDetail + String(id) + Constants.shared.apiKeyParameter + Constants.shared.apiKey
        NetworkHandler.sendRequest(url: url) { (data, error) in
            guard let data = data?.data else {
                completion(nil, nil)
                return
            }
            do {
                let object = try JSONDecoder().decode(MovieDetail.self, from: data)
                completion(object,nil)
                
            }catch let error {
                print(error.localizedDescription)
                completion(nil, error)
            }
        }
    }
}
