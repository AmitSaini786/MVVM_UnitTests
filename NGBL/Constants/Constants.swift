//
//  Constants.swift
//  NGBL
//
//  Created by Amit on 23/02/23.
//

import Foundation
import UIKit
enum API{
    static let baseURL = "https://61efc467732d93001778e5ac.mockapi.io/movies/"
    static let favourite = "favorites"
    static let moviesList = "list"
    static let imageBaseURL = "https://developers.themoviedb.org/3/getting-started/images"
}
enum Alert{
    static let title = "Demo"
    static let NoInternet = "No internet connectivity,Please check your internet connection and try again"
}
struct colors{
    static let BGColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
}
