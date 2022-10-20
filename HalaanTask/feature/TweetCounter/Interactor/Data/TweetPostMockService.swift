//
//  TweetPostMockService.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation

enum TweetPostMockResult{
    case serverError
    case validationError
    case success
}

struct TweetPostMockService: TweetPostServiceContract{
    
    private var targetResult: TweetPostMockResult
    
    init(targetResult: TweetPostMockResult) {
        self.targetResult = targetResult
    }
    
    func post(tweet: String, onFinish: @escaping TweetPostCallback) {
        switch targetResult {
        case .serverError:
            onFinish(.failure(.serverError))
        case .validationError:
            onFinish(.failure(.validationError))
        case .success:
            onFinish(.success(()))
        }
    }
    
}
