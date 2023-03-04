//
//  MoviesModel.swift
//  NGBL
//
//  Created by Amit on 24/02/23.
//

import Foundation

struct moviesResult : Codable{
    var results = [moviesModel]()
}
struct moviesModel : Codable{
    var poster_path : String?
    var title : String?
    var id : Int?
    var rating : Float?
    var isWatched : Bool?
    var release_date : String?
    var overview : String?
    var original_language : String?
    var isSelected : Bool?

}

