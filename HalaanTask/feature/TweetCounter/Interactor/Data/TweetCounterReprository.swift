//
//  TweetCounterReprository.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation

class TweetCounterReprository: TweetCounterReprositoryContract{
    
    private var service: TweetPostServiceContract
    
    init(service: TweetPostServiceContract) {
        self.service = service
    }
        
    func create(tweet: String, onFinish: @escaping TweetPostCallback) {
        service
            .post(tweet: tweet, onFinish: onFinish)
    }

}
