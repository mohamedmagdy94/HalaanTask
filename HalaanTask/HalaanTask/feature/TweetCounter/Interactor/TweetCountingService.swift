//
//  TweetCountingService.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation
import HalaanTaskEntity


protocol TweetCountingServiceContract{
    func count(from tweet: String)->TweetCountingResult
}

struct TweetCountingService: TweetCountingServiceContract{
    private let maxCharsCount: Int = 280
    
    func count(from tweet: String) -> TweetCountingResult {
        let count = tweet.precomposedStringWithCanonicalMapping.unicodeScalars.count
        let remaniningCharsCount = maxCharsCount - count
        let result = TweetCountingResult(countedChars: count, remainingChars: remaniningCharsCount)
        return result
    }
    
}
