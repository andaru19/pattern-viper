//
//  MovieInteractor.swift
//  VIPER-pattern
//
//  Created by Andaru on 18/07/23.
//  Copyright © 2023 Tootle. All rights reserved.
//
import Foundation
import Alamofire
import ObjectMapper

class MovieInteractor:PresenterToInteractorMovieProtocol{    
    
    var presenter: InteractorToPresenterMovieProtocol?
    
    func fetchMovie() {
        
        Alamofire.request(API_MOVIE_LIST).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["results"] as! NSArray
                    let arrayObject = Mapper<MovieModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.movieFetchSuccess(movieList: arrayObject)
                }
            }else {
                self.presenter?.movieFetchFailed()
            }
        }
        
    }
    
    
    
    
}
