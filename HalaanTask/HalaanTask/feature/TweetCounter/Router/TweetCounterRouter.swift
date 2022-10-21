//
//  TweetCounterRouter.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import UIKit
import HalaanTaskEntity
import HalaanTaskPresentation

class TweetCounterRouter: TweetCounterRouterContract{
    
    static func getScreen() -> UIViewController {
        let view = TweetCounterViewController(nibName: "TweetCounterViewController", bundle: Bundle(for: TweetCounterViewController.self))
        let configurator = TweetCounterConfigurator(view: view)
        let configuredView = configurator.configure()
        return configuredView
    }
    
}
