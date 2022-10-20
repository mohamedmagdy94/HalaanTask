//
//  TweetCounterViewContract.swift
//  HalaanTask
//
//  Created by Mohamed on 19/10/2022.
//

import Foundation

protocol TweetCounterViewContract: AnyObject{
    func setViewData(with data: TweetCounterViewData)
    func showError(with message: String)
    func showSuccess()
    func showLoading()
    func hideLoading()
    func setDependencies(presenter: TweetCounterPresenterInputContract)
}
