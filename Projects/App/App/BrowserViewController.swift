//
//  BrowserViewController.swift
//  App
//
//  Created by Ludovic Ollagnier on 23/06/2020.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController {

    @IBOutlet weak var purseLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!

    var destinationURL: URL?

    //init
    //loadView
    //plugOutlet
    //-------- Outlet exists
    //awakeFromNib
    //viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let destinationURL = destinationURL else {
                fatalError("No URL provided") }

        // Do any additional setup after loading the view.
        print("Browser")

        purseLabel.text = "0€"
        loadingActivityIndicator.startAnimating()

        webView.navigationDelegate = self

        initialLoading(destinationURL)
    }

    @IBAction func dismiss(_ sender: UIButton) {
        loadingActivityIndicator.stopAnimating()
    }

    private func initialLoading(_ url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

extension BrowserViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingActivityIndicator.stopAnimating()
    }
}
