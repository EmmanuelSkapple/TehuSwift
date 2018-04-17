//
//  ViewController.swift
//  TeuchitlanApp
//
//  Created by Emmanuel Garcia on 22/01/18.
//  Copyright © 2018 Emmanuel Garcia. All rights reserved.
//

import UIKit
import EstimoteProximitySDK
import Material
import Motion
import FirebaseAuth
import Firebase


class ViewController: UIViewController {
    
    @IBOutlet weak var TxtPassword: UITextField!
    
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var ButtonLogin: UIButton!
    
    @IBAction func action(_ sender: UIButton) {
        if txtemail.text != "" && TxtPassword.text != ""
        {
            Auth.auth().signIn(withEmail: txtemail.text!, password: TxtPassword.text!, completion: { (user, error) in
                if user != nil
                {
                  self.performSegue(withIdentifier: "segue", sender: self)
                }
                else
                {
                    if let myError = error?.localizedDescription
                    {
                        print(myError)
                    }
                    else
                    {
                        print("ERROR")
                    }
                }
                
                
            })
        }
        
    }
    

    override func viewDidLoad() {

        

    }

}
