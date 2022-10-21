//
//  TweetCounterViewController.swift
//  HalaanTask
//
//  Created by Mohamed on 19/10/2022.
//

import UIKit
import HalaanTaskEntity

public class TweetCounterViewController: UIViewController,Loadable,ErrorShowable,SuccessShowable {

    @IBOutlet weak var twitterLogo: UIImageView!
    @IBOutlet weak var typedCharsCount: UILabel!
    @IBOutlet weak var remainingCharsCount: UILabel!
    @IBOutlet weak var tweetInputField: UITextView!
    
    private var presenter: TweetCounterPresenterInputContract?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        tweetInputField.delegate = self
        twitterLogo.image = UIImage(named: "Twitter logo")
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
}

extension TweetCounterViewController: UITextViewDelegate{
    public func textViewDidChange(_ textView: UITextView) {
        let newText = textView.text ?? ""
        presenter?.onUserTyped(with: newText)
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        let newText = textView.text ?? ""
        presenter?.onUserBeginTyping(with: newText)
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        let newText = textView.text ?? ""
        presenter?.onUserFinishedTyping(with: newText)
    }
}

extension TweetCounterViewController: TweetCounterViewContract{
    
    public func setViewData(with data: TweetCounterViewData) {
        typedCharsCount.text = data.typedCharacters
        remainingCharsCount.text = data.remainingCharacters
        tweetInputField.text = data.tweetInputFieldText
    }
    
    public func showError(with message: String) {
        showErrorAlert(with: message)
    }
    
    public func showSuccess() {
        showSuccessAlert()
    }
    
    public func showLoading() {
        showLoadingIndicator()
    }
    
    public func hideLoading() {
        hideLoadingIndicator()
    }
    
    public func setDependencies(presenter: TweetCounterPresenterInputContract){
        self.presenter = presenter
    }
}
