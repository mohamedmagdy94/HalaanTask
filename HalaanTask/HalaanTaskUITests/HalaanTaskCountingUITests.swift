//
//  HalaanTaskCountingUITests.swift
//  HalaanTaskUITests
//
//  Created by Mohamed on 21/10/2022.
//

import XCTest


final class HalaanTaskCountingUITests: XCTestCase {

    func testCounting(){
        let app = XCUIApplication()
        app.launch()
        let tweet = "123"
        let textView = app.textViews["tweetInputField"]
        textView.tap()
        textView.typeText(tweet)
        let countLabel = app.staticTexts["tweetCountLabel"]
        let countText = countLabel.label ?? ""
        let targetText = "3/280"
        let expression = countText == targetText
        XCTAssertTrue(expression)
    }
}
