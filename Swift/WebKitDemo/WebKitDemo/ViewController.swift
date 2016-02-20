//
//  ViewController.swift
//  WebKitDemo
//
//  Created by ligulfzhou on 2/20/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView?
    override func viewDidLoad() {
        super.viewDidLoad()

        let preferences = WKPreferences()
        preferences.javaScriptEnabled = false
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        
        if let theWebView = webView{
            let url = NSURL(string: "http://192.168.1.100:8888")
            let urlRequest = NSURLRequest(URL: url!)
            theWebView.loadRequest(urlRequest)
            theWebView.navigationDelegate = self
            view.addSubview(theWebView)
        }
    }

    //MARK: webkit navigation delegate
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        /* Do not allow links to be tapped */
        if navigationAction.navigationType == .LinkActivated{
            decisionHandler(.Cancel)
            
            let alertController = UIAlertController(title: "Action not allowed", message: "Tapping on links is not allowed. Sorry!", preferredStyle: .Alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler:nil))
            presentViewController(alertController,
                                animated: true,
                                completion: nil)
            return
        }
        decisionHandler(.Allow);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

