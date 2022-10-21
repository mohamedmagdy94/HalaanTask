//
//  UIViewController.swift
//  HalaanTask
//
//  Created by Mohamed on 19/10/2022.
//

import UIKit

protocol Loadable{
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

protocol ErrorShowable{
    func showErrorAlert(with message: String)
}

protocol SuccessShowable{
    func showSuccessAlert()
}

extension Loadable where Self: UIViewController{
    func showLoadingIndicator(){
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.tag = 999
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        view.bringSubviewToFront(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideLoadingIndicator(){
        guard let spinner = view.viewWithTag(999) as? UIActivityIndicatorView else{ return }
        spinner.stopAnimating()
        spinner.removeFromSuperview()
    }
}

extension ErrorShowable where Self: UIViewController{
    func showErrorAlert(with message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension SuccessShowable where Self: UIViewController{
    func showSuccessAlert(){
        let alert = UIAlertController(title: "Success", message: "Action Completed", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}


