//
//  Favourite.swift
//  NGBL
//
//  Created by Amit on 24/02/23.
//

import Foundation

struct ResultsFav : Codable{
    var results = [favoriteModel]()
}

struct favoriteModel : Codable{
    var id : Int?
}
