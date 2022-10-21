//
//  TweetCounterReprositoryContract.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation

public typealias TweetPostCallback = (Result<Void,TweetCounterError>)->()

public protocol TweetCounterReprositoryContract: AnyObject{
    func create(tweet: String,onFinish: @escaping TweetPostCallback)
}

public protocol TweetPostServiceContract: AnyObject{
    func post(tweet: String,onFinish: @escaping TweetPostCallback)
}
