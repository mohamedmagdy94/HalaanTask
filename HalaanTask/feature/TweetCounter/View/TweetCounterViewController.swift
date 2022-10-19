//
//  TweetCounterViewController.swift
//  HalaanTask
//
//  Created by Mohamed on 19/10/2022.
//

import UIKit

class TweetCounterViewController: UIViewController,Loadable,ErrorShowable,SuccessShowable {

    @IBOutlet weak var typedCharsCount: UILabel!
    @IBOutlet weak var remainingCharsCount: UILabel!
    @IBOutlet weak var tweetInputField: UITextView!
    
    private var presenter: TweetCounterPresenterInputContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onCopyTextTapped(_ sender: Any) {
        presenter?.copyText()
    }
    
    @IBAction func onClearTextTapped(_ sender: Any) {
        presenter?.clearText()
    }
    
    @IBAction func onPostTweetTapped(_ sender: Any) {
        presenter?.postTweet()
    }
    
    func setPresenter(with presenter: TweetCounterPresenterInputContract){
        self.presenter = presenter
    }
}

extension TweetCounterViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        let newText = textView.text ?? ""
        presenter?.onUserTyped(with: newText)
    }
}

extension TweetCounterViewController: TweetCounterViewContract{
    
    func setViewData(with data: TweetCounterViewData) {
        typedCharsCount.text = data.typedCharacters
        remainingCharsCount.text = data.remainingCharacters
        tweetInputField.text = data.tweetInputFieldText
    }
    
    func showError(with message: String) {
        showErrorAlert(with: message)
    }
    
    func showSuccess() {
        showSuccessAlert()
    }
    
    func showLoading() {
        showLoadingIndicator()
    }
    
    func hideLoading() {
        hideLoadingIndicator()
    }
}
