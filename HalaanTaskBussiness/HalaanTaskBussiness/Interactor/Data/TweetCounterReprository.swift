//
//  TweetCounterReprository.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation
import HalaanTaskEntity

public class TweetCounterReprository: TweetCounterReprositoryContract{
    
    private var service: TweetPostServiceContract
    
    public init(service: TweetPostServiceContract) {
        self.service = service
    }
        
    public func create(tweet: String, onFinish: @escaping TweetPostCallback) {
        service
            .post(tweet: tweet, onFinish: onFinish)
    }

}
