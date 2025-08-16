//
//  ViewController.swift
//  Project4
//
//  Created by Praveen Agarwal on 16/08/25.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(showOptions))
    }
    
    @objc func showOptions() {
        let alert = UIAlertController(title: "Open Page...", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "apple", style: .default, handler: openPage))
        alert.addAction(UIAlertAction(title: "hackingwithswift", style: .default, handler: openPage))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(alert, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        guard let urlString = action.title else { return }
        guard let url = URL(string: "https://\(urlString).com") else { return }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}

