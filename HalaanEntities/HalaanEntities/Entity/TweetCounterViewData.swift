//
//  TweetCounterViewData.swift
//  HalaanTask
//
//  Created by Mohamed on 19/10/2022.
//

import Foundation

public struct TweetCounterViewData{
    public var typedCharacters: String
    public var remainingCharacters: String
    public var tweetInputFieldText: String
    
    public init(typedCharacters: String, remainingCharacters: String, tweetInputFieldText: String) {
        self.typedCharacters = typedCharacters
        self.remainingCharacters = remainingCharacters
        self.tweetInputFieldText = tweetInputFieldText
    }
    
}
