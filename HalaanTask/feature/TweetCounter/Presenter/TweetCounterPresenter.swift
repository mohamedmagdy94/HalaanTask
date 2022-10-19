//
//  TweetCounterPresenter.swift
//  HalaanTask
//
//  Created by Mohamed on 19/10/2022.
//

import Foundation
import UIKit

class TweetCounterPresenter: TweetCounterPresenterContract{
    
    private var tweet: String
    private var interactor: TweetCounterInteractorContract?
    private var view: TweetCounterViewContract?
    
    init(interactor: TweetCounterInteractorContract?,view: TweetCounterViewContract?) {
        self.tweet = ""
        self.interactor = interactor
        self.view = view
    }
    
    func onUserTyped(with tweet: String) {
        self.tweet = tweet
        let countResult = interactor?.countCharsOnTweet(with: tweet)
        let viewData = TweetCounterViewData(typedCharacters: "\(countResult?.countedChars ?? 0)/280", remainingCharacters: "\(countResult?.remainingChars ?? 0)", tweetInputFieldText: tweet)
        view?.setViewData(with: viewData)
    }
    
    func copyText() {
        UIPasteboard.general.string = tweet
    }
    
    func clearText() {
        tweet = ""
        let viewData = TweetCounterViewData(typedCharacters: "0/280", remainingCharacters: "280", tweetInputFieldText: "")
        view?.setViewData(with: viewData)
    }
    
    func postTweet() {
        view?.showLoading()
        interactor?.postTweet(with: tweet)
    }
    
    func onPostTweetSuccess() {
        view?.hideLoading()
        view?.showSuccess()
    }
    
    func onPostTweetError(with error: TweetCounterError) {
        view?.hideLoading()
        switch error{
        case .serverError:
            view?.showError(with: "server error")
        case .validationError:
            view?.showError(with: "validation error")
        }
    }
    
    
}
