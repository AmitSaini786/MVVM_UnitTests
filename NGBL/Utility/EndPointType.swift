//
//  EndPointType.swift
//  NGBL
//
//  Created by Amit on 24/02/23.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType{
    var path :String {get}
    var baseURL : String {get}
    var url : URL? {get}
    var methods : HTTPMethods {get}
    var body : Encodable? {get}
    var headers : [String:String]? {get}
}
