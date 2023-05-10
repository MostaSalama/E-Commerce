//
//  SignUpViewController.swift
//  E-Commerce
//
//  Created by mac on 05/05/2023.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    static let ID = String(describing: SignUpViewController.self)
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var checkMarkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkMarkButton.imageView?.isHidden = true
    }
    
    @IBAction func checkMarkButtonPressed(_ sender: Any) {
        if checkMarkButton.isSelected {
            checkMarkButton.imageView?.isHidden = false
        }else{
            checkMarkButton.imageView?.isHidden = true
        }
        
        checkMarkButton.borderWidth = 0.5
        
    }
    
    @IBAction func LoginPressed(_ sender: Any) {
        
        if let email = emailTextField.text , let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              // ...
                if let e = error {
                    let alert = UIAlertController(title: "Couldnt Sign up!", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .default))
                    self.present(alert,animated: true ,completion: nil)
                }else{
                    self.navigate(SuccessScreenViewController.ID)
                }
                
                }
            }
        
    }
    

}
