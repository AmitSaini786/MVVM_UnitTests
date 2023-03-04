//
//  HomeScreenUnitTests.swift
//  NGBLTests
//
//  Created by Amit on 04/03/23.
//

import XCTest
import Foundation
@testable import NGBL

final class HomeScreenUnitTests: XCTestCase {
    
    func testnternet_Connectivity(){
        let internetConnectivity =  InternetAvaiable()
        let status = internetConnectivity.isInternetAvailable()
        XCTAssertNotNil(status)
        XCTAssertEqual(status, true)
    }

    func testGetMoviesListApi_Response(){
        
        //check url valid or not
        XCTAssertEqual(API.baseURL +  API.moviesList, "https://61efc467732d93001778e5ac.mockapi.io/movies/list")
        let expectation = self.expectation(description: "testGetMoviesListApi_Response")
        APIManager.shared.request(modelType: moviesResult.self, type: APIEndPoint.moivesList) { response  in
            XCTAssertNotNil(response)
            switch response{
            case .success(let movies):
            XCTAssertFalse(movies.results.count == 0)
            case .failure( let err):
                XCTAssertNotNil(err)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler:{ error in
            print(error?.localizedDescription ?? "")
        })
    }
    
    func testFavouriteListApi_Response(){
        XCTAssertEqual(API.baseURL +  API.favourite, "https://61efc467732d93001778e5ac.mockapi.io/movies/favorites")
        let expectation = self.expectation(description: "testFavouriteListApi_Response")
        APIManager.shared.request(modelType: ResultsFav.self, type: APIEndPoint.favourites) { response  in
            XCTAssertNotNil(response)
            switch response{
            case .success(let fav):
                XCTAssertFalse(fav.results.count != 0)
            case .failure( let err):
                XCTAssertNotNil(err)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler:{ error in
            print(error?.localizedDescription ?? "")
        })
    }

}
