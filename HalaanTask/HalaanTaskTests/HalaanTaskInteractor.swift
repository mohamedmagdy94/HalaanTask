//
//  HalaanTaskInteractor.swift
//  HalaanTaskTests
//
//  Created by Mohamed on 21/10/2022.
//

import XCTest
import HalaanTaskBussiness

final class HalaanTaskInteractor: XCTestCase {

    func testTweetCountService(){
        let tweet = "123"
        let service = TweetCountingService()
        let count = service.count(from: tweet)
        let expression = count.countedChars == 3
        XCTAssertTrue(expression)
    }

}
