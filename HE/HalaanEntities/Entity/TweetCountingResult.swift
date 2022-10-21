//
//  TweetCountingResult.swift
//  HalaanTask
//
//  Created by Mohamed on 19/10/2022.
//

import Foundation

public struct TweetCountingResult{
    public var countedChars: Int
    public var remainingChars: Int
    
    public init(countedChars: Int, remainingChars: Int) {
        self.countedChars = countedChars
        self.remainingChars = remainingChars
    }
    
}
