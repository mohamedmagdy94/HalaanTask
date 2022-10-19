//
//  TweetCounterPresenterContract.swift
//  HalaanTask
//
//  Created by Mohamed on 19/10/2022.
//

import Foundation

protocol TweetCounterPresenterInputContract{
    func onUserTyped(with tweet: String)
    func copyText()
    func clearText()
    func postTweet()
}

protocol TweetCounterPresenterOutputContract{
    func onPostTweetSuccess()
    func onPostTweetError(with error: TweetCounterError)
}

typealias TweetCounterPresenterContract = TweetCounterPresenterInputContract & TweetCounterPresenterOutputContract


