//
//  TweetCounterPresenter.swift
//  HalaanTask
//
//  Created by Mohamed on 19/10/2022.
//

import Foundation
import UIKit
import HalaanTaskEntity

public class TweetCounterPresenter: TweetCounterPresenterContract{
    
    private var tweet: String
    private var interactor: TweetCounterInteractorContract?
    weak private var view: TweetCounterViewContract?
    
    public init(interactor: TweetCounterInteractorContract?,view: TweetCounterViewContract?) {
        self.tweet = ""
        self.interactor = interactor
        self.view = view
    }
    
    public func onUserTyped(with tweet: String) {
        self.tweet = tweet
        refreshView(with: tweet)
    }
    
    public func onUserBeginTyping(with tweet: String){
        let placeholder = "Start typing! You can enter up to 280 characters"
        let inputFieldText = tweet == placeholder ? "" : tweet
        refreshView(with: inputFieldText)
    }
    
    public func onUserFinishedTyping(with tweet: String){
        let placeholder = "Start typing! You can enter up to 280 characters"
        let inputFieldText = tweet == "" ? placeholder : tweet
        refreshView(with: inputFieldText)
    }
    
    private func refreshView(with text: String){
        let countResult = interactor?.countCharsOnTweet(with: text)
        let viewData = TweetCounterViewData(typedCharacters: "\(countResult?.countedChars ?? 0)/280", remainingCharacters: "\(countResult?.remainingChars ?? 0)", tweetInputFieldText: text)
        view?.setViewData(with: viewData)
    }

    
    public func copyText() {
        UIPasteboard.general.string = tweet
    }
    
    public func clearText() {
        tweet = ""
        let viewData = TweetCounterViewData(typedCharacters: "0/280", remainingCharacters: "280", tweetInputFieldText: "")
        view?.setViewData(with: viewData)
    }
    
    public func postTweet() {
        view?.showLoading()
        interactor?.postTweet(with: tweet)
    }
    
    public func onPostTweetSuccess() {
        view?.hideLoading()
        view?.showSuccess()
    }
    
    public func onPostTweetError(with error: TweetCounterError) {
        view?.hideLoading()
        switch error{
        case .serverError:
            view?.showError(with: "server error")
        case .validationError:
            view?.showError(with: "validation error")
        }
    }
    
    
}
