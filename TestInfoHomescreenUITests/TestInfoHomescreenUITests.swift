//
//  TestInfoHomescreenUITests.swift
//  TestInfoHomescreenUITests
//
//  Created by Jason Jones on 09/12/2019.
//  Copyright © 2019 Jones, Jason (Developer). All rights reserved.
//

import XCTest

class TestInfoHomescreenUITests: XCTestCase {

    override func setUp() {
        XCUIDevice.shared.orientation = .portrait
        continueAfterFailure = false
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testScreenshots() {
        let app = XCUIApplication()
        app.launch()
        
        XCUIDevice.shared.press(.home)
        
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        let appIcon = springboard.icons["Device Info"]
        let todayView = springboard.buttons["DEVICE INFO"]
        
        _ = appIcon.waitForExistence(timeout: 10)
                        
        appIcon.press(forDuration: 1)
        
        _ = todayView.waitForExistence(timeout: 2)
        
        springboard.coordinate(withNormalizedOffset: CGVector(dx: 100, dy: 100)).tap()
        
        let bottomPoint = springboard.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 2))
        springboard.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0)).press(forDuration: 0.1, thenDragTo: bottomPoint)
        
        // Open Today View
        springboard.scrollViews.firstMatch.swipeRight()
        
        if !todayView.exists {
            let editButton = springboard.buttons["Edit"]
            editButton.tap()
            
            springboard.buttons["Insert Device Info"].tap()
            springboard.buttons["Done"].tap()
        }
    }
}
