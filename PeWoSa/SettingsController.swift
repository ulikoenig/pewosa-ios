//
//  settingsController.swift
//  PeWoSa
//
//  Created by Uli on 11.11.16.
//  Copyright © 2016 Uli. All rights reserved.
//
import UIKit


class SettingsController: UIViewController {
    
    @IBOutlet var usernameF: UITextField!
    @IBOutlet var passwordF: UITextField!
    
    @IBAction func onUsernameEdited(_ sender: UITextField) {
        //print("Benutzername geändert: "+usernameF.text!)
        UserDefaults.standard.set(usernameF.text,forKey: "username")
    }
    
    @IBAction func onPasswordEdited(_ sender: UITextField) {
        //print("Passwort geändert: "+passwordF.text!)
        UserDefaults.standard.set(passwordF.text,forKey: "password")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameF.text = UserDefaults.standard.string(forKey: "username")
        passwordF.text = UserDefaults.standard.string(forKey: "password")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

