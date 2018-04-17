//
//  RegistroViewController.swift
//  TeuchitlanApp
//
//  Created by Emmanuel Garcia on 30/03/18.
//  Copyright © 2018 Emmanuel Garcia. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegistroViewController: UIViewController {

    @IBOutlet weak var txtemailR: UITextField!
    
    @IBOutlet weak var txtpassR: UITextField!
    
    @IBOutlet var btnRegistro: UIView!
    
    @IBAction func action(_ sender: UIButton) {
        
        if txtemailR.text != "" && txtpassR.text != ""
        {
            Auth.auth().createUser(withEmail:txtemailR.text! , password: txtpassR.text!, completion:{ (user, error) in
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
            }
            )
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
