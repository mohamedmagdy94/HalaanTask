//
//  TweetCounterInteractor.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation
import HalaanTaskEntity

public class TweetCounterInteractor: TweetCounterInteractorContract{

    weak private var presenter: TweetCounterPresenterOutputContract?
    private var countService: TweetCountingServiceContract
    private var repo: TweetCounterReprositoryContract
    
    public init(presenter: TweetCounterPresenterOutputContract? = nil, countService: TweetCountingServiceContract,repo: TweetCounterReprositoryContract) {
        self.presenter = presenter
        self.countService = countService
        self.repo = repo
    }
    
    public func postTweet(with tweet: String) {
        let tweetValidation = validateTweet(with: tweet)
        if tweetValidation{
            repo.create(tweet: tweet, onFinish: handleTweetPostCallback)
        }else{
            presenter?.onPostTweetError(with: .validationError)
        }
    }
    
    private func validateTweet(with tweet: String)->Bool{
        let count = countCharsOnTweet(with: tweet)
        return count.countedChars <= 280
    }
    
    private func handleTweetPostCallback(result: Result<Void,TweetCounterError>){
        switch result{
        case .success():
            presenter?.onPostTweetSuccess()
        case .failure(let error):
            presenter?.onPostTweetError(with: error)
        }
    }
    
    public func countCharsOnTweet(with tweet: String) -> TweetCountingResult {
        let count = countService.count(from: tweet)
        return count
    }
    
    public func setDependencies(with presenter: TweetCounterPresenterOutputContract) {
        self.presenter = presenter
    }
}
