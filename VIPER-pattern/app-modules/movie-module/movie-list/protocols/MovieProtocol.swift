//
//  MovieProtocol.swift
//  VIPER-pattern
//
//  Created by Andaru on 18/07/23.
//  Copyright © 2023 Tootle. All rights reserved.
//

import Foundation

protocol ViewToPresenterMovieProtocol:class{
    
    var view: PresenterToViewMovieProtocol? {get set}
    var interactor: PresenterToInteractorMovieProtocol? {get set}
    var router: PresenterToRouterMovieProtocol? {get set}
    func startFetchingMovie()

}

protocol PresenterToViewMovieProtocol:class {
    
    func onMovieResponseSuccess(movieModelArrayList:Array<MovieModel>)
    func onMovieResponseFailed(error:String)
    
}

protocol PresenterToRouterMovieProtocol:class {
    
    static func createMovieModule()->MovieViewController

}

protocol PresenterToInteractorMovieProtocol:class {
    
    var presenter:InteractorToPresenterMovieProtocol? {get set}
    func fetchMovie()
    
}

protocol InteractorToPresenterMovieProtocol:class {
    
    func movieFetchSuccess(movieList:Array<MovieModel>)
    func movieFetchFailed()
    
}
