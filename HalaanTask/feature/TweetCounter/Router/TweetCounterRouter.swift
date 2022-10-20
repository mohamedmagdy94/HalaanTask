//
//  TweetCounterRouter.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import UIKit

class TweetCounterRouter: TweetCounterRouterContract{
    
    static func getScreen() -> UIViewController {
        let view = TweetCounterViewController()
        let configurator = TweetCounterConfigurator(view: view)
        let configuredView = configurator.configure()
        return configuredView
    }
    
}
