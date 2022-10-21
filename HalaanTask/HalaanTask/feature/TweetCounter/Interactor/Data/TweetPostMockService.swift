//
//  TweetPostMockService.swift
//  HalaanTask
//
//  Created by Mohamed on 20/10/2022.
//

import Foundation
import HalaanTaskEntity

enum TweetPostMockResult{
    case serverError
    case validationError
    case success
}

class TweetPostMockService: TweetPostServiceContract{
    
    private var targetResult: TweetPostMockResult
    
    init(targetResult: TweetPostMockResult) {
        self.targetResult = targetResult
    }
    
    func post(tweet: String, onFinish: @escaping TweetPostCallback) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {[weak self] in
            guard let self = self else{ return }
            switch self.targetResult {
            case .serverError:
                onFinish(.failure(.serverError))
            case .validationError:
                onFinish(.failure(.validationError))
            case .success:
                onFinish(.success(()))
            }
        }
    }
    
}
