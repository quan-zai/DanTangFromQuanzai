//
//  XZQDetailViewController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/15.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit
import SVProgressHUD

class XZQDetailViewController: XZQBaseViewController {
    
    var homeItem: XZQHomeItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = UIWebView()
        webView.frame = view.bounds
        
        // 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
    
        // 检测超链接
        webView.dataDetectorTypes = .All
        
        let url = NSURL(string: homeItem!.content_url!)
        
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        webView.delegate = self
        view.addSubview(webView)
    }
}

extension XZQDetailViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.setStatus("正在加载...")
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}
