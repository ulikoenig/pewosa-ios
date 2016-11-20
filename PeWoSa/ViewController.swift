//
//  ViewController.swift
//  PeWoSa
//
//  Created by Uli on 11.11.16.
//  Copyright © 2016 Uli. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var webViewObj: UIWebView!
    private var webView: WKWebView?
    private var username:String!
    private var password:String!

    
    @IBAction func exitButton(_ sender: UIBarButtonItem) {
        exit(0)
    }
    
    override func loadView() {
        webView = WKWebView()
        
        view = webView
    }
    
    
    func restoreUserSettings() {
        username = ""
        password = ""
        if (UserDefaults.standard.object(forKey: "username")  != nil){
            username = UserDefaults.standard.string(forKey: "username")!
        }
        if (UserDefaults.standard.object(forKey: "password")  != nil){
            password = UserDefaults.standard.string(forKey: "password")!
        }
    }
    
    
    
    func loadStartPage(){
        restoreUserSettings()
        let url = URL(string: "https://ulikoenig.de/pewosa/login.php?login=1&username="+username+"&password="+password)
        var requestObj = URLRequest(url: url!);
        let userAgent = "de.ulikoenig.pewosa/android";
        requestObj.setValue(userAgent, forHTTPHeaderField: "User-Agent")
        webView?.load(requestObj);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       loadStartPage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsViewC = segue.destination as! SettingsController
        print("prepareForSegue");
    }
    
    @IBAction func actionForUnwindButton(sender: AnyObject) {
        print("actionForUnwindButton");
    }

    @IBAction func reloadClicked(_ sender: UIBarButtonItem) {
        webView?.reload()
    }
    @IBAction func homeBtnClicked(_ sender: UIBarButtonItem) {
        loadStartPage()
    }
}

