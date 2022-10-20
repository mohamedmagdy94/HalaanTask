//
//  TweetCounterReprositoryContract.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation

typealias TweetPostCallback = (Result<Void,TweetCounterError>)->()

protocol TweetCounterReprositoryContract: AnyObject{
    func create(tweet: String,onFinish: @escaping TweetPostCallback)
}

protocol TweetPostServiceContract: AnyObject{
    func post(tweet: String,onFinish: @escaping TweetPostCallback)
}
