//
//  TweetCounterReprositoryContract.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation

typealias TweetPostCallback = (Result<Void,TweetCounterError>)->()

protocol TweetCounterReprositoryContract{
    func create(tweet: String,onFinish: @escaping TweetPostCallback)
}

protocol TweetPostServiceContract{
    func post(tweet: String,onFinish: @escaping TweetPostCallback)
}
