//
//  NGBLUITests.swift
//  NGBLUITests
//
//  Created by Amit on 23/02/23.
//

import XCTest
import Foundation
import UIKit

final class NGBLUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .staticText)["Old"].swipeLeft()
        tablesQuery.collectionViews.containing(.other, identifier:"Vertical scroll bar, 2 pages").element.swipeRight()
        tablesQuery.children(matching: .cell).element(boundBy: 4).staticTexts["Jungle Cruise"].swipeUp()
        tablesQuery.children(matching: .cell).element(boundBy: 6).staticTexts["Old"]/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//       let nextButton = app.buttons["Next"].tap()
//        XCTAssertTrue(nextButton)
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).tap()
        app.navigationBars["Movie Details"].buttons["Movie App"].tap()
        tablesQuery.children(matching: .cell).element(boundBy: 19).staticTexts["Venom"].tap()
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
