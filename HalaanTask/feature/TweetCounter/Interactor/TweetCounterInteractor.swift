//
//  TweetCounterInteractor.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation

class TweetCounterInteractor: TweetCounterInteractorContract{

    private var presenter: TweetCounterPresenterOutputContract?
    private var countService: TweetCountingServiceContract
    
    init(presenter: TweetCounterPresenterOutputContract? = nil, countService: TweetCountingServiceContract) {
        self.presenter = presenter
        self.countService = countService
    }
    
    func postTweet(with tweet: String) {
    
    }
    
    func countCharsOnTweet(with tweet: String) -> TweetCountingResult {
        let count = countService.count(from: tweet)
        return count
    }
    
    func setDependencies(with presenter: TweetCounterPresenterOutputContract) {
        self.presenter = presenter
    }
}
