//
//  ViewController.swift
//  QuickGoogleTranslate
//
//  Created by Keisuke Kawamura on 2018/09/30.
//  Copyright © 2018 Keisuke Kawamura. All rights reserved.
//

import Cocoa
import WebKit

final class ViewController: NSViewController, WKNavigationDelegate {

    @IBOutlet private weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        let url = URL(string: "https://translate.google.com")!
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url,
            let host = URLComponents(url: url, resolvingAgainstBaseURL: false)?.host,
            host.contains("translate.google.com") {

            decisionHandler(.allow)
        } else {
            decisionHandler(.cancel)
        }
    }
}
