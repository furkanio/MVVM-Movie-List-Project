//
//  NetworkHandler.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import Alamofire

class NetworkHandler{
    class func sendRequest(url: String , completion: @escaping (_ data : AFDataResponse<Data>?, _ error: Error?) -> Void){
//        let params : [String:Any] = ["api_key": Constants.shared.apiKey , "page" : 5 ]
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding(destination: .queryString)).validate(contentType: ["application/json"])
        .responseData(completionHandler: { (response) in
            guard response.data != nil else {
                completion(nil, nil)
                return
            }
            completion(response, nil)
            })
    }
}

