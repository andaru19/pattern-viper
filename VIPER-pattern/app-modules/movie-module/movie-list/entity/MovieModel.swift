//
//  MovieModel.swift
//  VIPER-pattern
//
//  Created by Andaru on 18/07/23.
//  Copyright © 2023 Tootle. All rights reserved.
//

import Foundation
import ObjectMapper

private let ID = "id"
private let TITLE = "original_title"
private let BRIEF = "overview"
private let IMAGESOURCE = "backdrop_path"

class MovieModel:Mappable{
    
    internal var id:String?
    internal var title:String?
    internal var brief:String?
    internal var imagesource:String?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        id <- map[ID]
        title <- map[TITLE]
        brief <- map[BRIEF]
        imagesource <- map[IMAGESOURCE]
    }
    
}
