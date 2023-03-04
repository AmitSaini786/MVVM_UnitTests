//
//  APIEndPoint.swift
//  NGBL
//
//  Created by Amit on 24/02/23.
//

import Foundation

enum APIEndPoint{
    case favourites // Get
    case moivesList
}

extension APIEndPoint : EndPointType{
    var path: String {
        switch self{
        case .favourites:
            return API.favourite
        case .moivesList:
            return API.moviesList
        }
    }
    
    var baseURL: String {
        return API.baseURL
    }
    
    var url: URL? {
        switch self{
        case .favourites:
            return URL(string: "\(baseURL)\(path)")
        case .moivesList:
            return URL(string: "\(baseURL)\(path)")
        }
    }
    
    var methods: HTTPMethods {
        switch self{
        case .favourites:
            return .get
        case .moivesList:
            return .get
        }
    }
    
    var body: Encodable? {
        switch self{
        case .favourites:
            return nil
        case .moivesList:
            return nil
        }
    }
    
    var headers: [String : String]? {
        APIManager.commonHeaders
    }
    
    
}
