//
//  LoginViewController.swift
//  E-Commerce
//
//  Created by mac on 04/05/2023.
//

import UIKit
import Firebase
import FBSDKLoginKit
import GoogleSignIn


class LoginViewController: UIViewController, LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me"
                                                 , parameters: ["fields":"email"]
                                                 , tokenString: token
                                                 , version: nil
                                                 , httpMethod: .get)
        request.start { GraphRequestConnection, result, error in
            
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        navigate(SuccessScreenViewController.ID)
    }
    
    
    static let ID = String(describing: LoginViewController.self)
    
    let signInConfig = GIDConfiguration.init(clientID: "com.googleusercontent.apps.244409358118-tkjllkbefq7h0afog6dv90mls58e83ek")
    @IBOutlet var emailadressfield: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var facebookLogin: FBLoginButton!
    @IBOutlet var googleLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        if let token = AccessToken.current,
               !token.isExpired {
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me"
                                                     , parameters: ["fields":"email"]
                                                     , tokenString: token
                                                     , version: nil
                                                     , httpMethod: .get)
            request.start { GraphRequestConnection, result, error in
                print("\(String(describing: result))")
            }        }else{
            facebookLogin.permissions = ["public_profile", "email"]
//                facebookLogin.nonce
                facebookLogin.cornerRadius = 0
                
            facebookLogin.delegate = self
        }
        
    }
        
    @IBAction func loginPressed(_ sender: Any) {
        if let email = emailadressfield.text , let password = passwordField.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alert = UIAlertController(title: "Couldn't log in!", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: .default))
                    self.present(alert, animated: true)
                }else{
                    self.navigate(SuccessScreenViewController.ID)
                }
            }
        }
        
    }
    
    @IBAction func googleLogin(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        GIDSignIn.sharedInstance.configuration = config

        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene
        let window = windowScenes?.windows.first
        guard let rootViewController = window?.rootViewController else { return }

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
            if let e = error {
                let alert = UIAlertController(title: "Coudlnt log in!", message: e.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try again", style: .cancel))
                self.present(alert,animated: true,completion: nil)
            }else{
                self.navigate(SuccessScreenViewController.ID)
            }
        }
        
    }
    

}

