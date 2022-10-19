//
//  TweetCounterInteractorContract.swift
//  HalaanTask
//
//  Created by Mohamed on 19/10/2022.
//

import Foundation

protocol TweetCounterInteractorContract{
    func postTweet(with tweet: String)
    func countCharsOnTweet(with tweet: String)->TweetCountingResult
}