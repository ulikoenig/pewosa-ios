//
//  ViewController.swift
//  PeWoSa
//
//  Created by Uli on 22.10.16.
//  Copyright © 2016 Uli. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
  
    
    private var webView: WKWebView?
    
    override func loadView() {
        webView = WKWebView()
        
        //If you want to implement the delegate
        //webView?.navigationDelegate = self
        
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = UserDefaults.standard
       defaults.set("User-Agent", forKey: "User-Agent")
        
        let url = URL(string: "https://ulikoenig.de/pewosa/info.php")
        var requestObj = URLRequest(url: url!);
        let userAgent = "de.ulikoenig.pewosa/android";
        requestObj.setValue(userAgent, forHTTPHeaderField: "User-Agent")
        webView?.load(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reloadContent(_ sender: UIBarButtonItem) {
        webView?.reload()
    }

    @IBAction func loadStartpage(_ sender: AnyObject) {
        let url = URL(string: "https://ulikoenig.de/pewosa/")
        var requestObj = URLRequest(url: url!);
        webView?.load(requestObj);
    }
    
    @IBAction func storeSettings(_ sender: UIButton) {
    }

    
}

