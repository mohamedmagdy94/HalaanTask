//
//  TweetCounterInteractor.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation

class TweetCounterInteractor: TweetCounterInteractorContract{

    weak private var presenter: TweetCounterPresenterOutputContract?
    private var countService: TweetCountingServiceContract
    private var repo: TweetCounterReprositoryContract
    
    init(presenter: TweetCounterPresenterOutputContract? = nil, countService: TweetCountingServiceContract,repo: TweetCounterReprositoryContract) {
        self.presenter = presenter
        self.countService = countService
        self.repo = repo
    }
    
    func postTweet(with tweet: String) {
        repo.create(tweet: tweet, onFinish: handleTweetPostCallback)
    }
    
    private func handleTweetPostCallback(result: Result<Void,TweetCounterError>){
        switch result{
        case .success():
            presenter?.onPostTweetSuccess()
        case .failure(let error):
            presenter?.onPostTweetError(with: error)
        }
    }
    
    func countCharsOnTweet(with tweet: String) -> TweetCountingResult {
        let count = countService.count(from: tweet)
        return count
    }
    
    func setDependencies(with presenter: TweetCounterPresenterOutputContract) {
        self.presenter = presenter
    }
}
