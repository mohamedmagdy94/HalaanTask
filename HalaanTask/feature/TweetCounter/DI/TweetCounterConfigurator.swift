//
//  TweetCounterConfigurator.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation

class TweetCounterConfigurator: TweetCounterConfiguratorContract{
    
    var view: TweetCounterViewController
    
    init(view: TweetCounterViewController) {
        self.view = view
    }
    
    func configure() -> TweetCounterViewController {
        let interactor = createInteractor()
        let presenter = createPresenter(with: interactor)
        interactor.setDependencies(with: presenter)
        view.setDependencies(presenter: presenter)
        return view
    }
    
    private func createPresenter(with interactor: TweetCounterInteractorContract)->TweetCounterPresenterContract{
        let presenter = TweetCounterPresenter(interactor: interactor, view: view)
        return presenter
    }
    
    private func createInteractor()->TweetCounterInteractorContract{
        let countService = TweetCountingService()
        let tweetPostService = TweetPostMockService(targetResult: .success)
        let repo = TweetCounterReprository(service: tweetPostService)
        let interactor = TweetCounterInteractor(countService: countService, repo: repo)
        return interactor
    }
    
}
