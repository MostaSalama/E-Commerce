//
//  ViewController.swift
//  E-Commerce
//
//  Created by mac on 27/04/2023.
//

import UIKit



class launchScreen: UIViewController {
    
    
    
    var delegate : directionImplement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: onBoarding.ID) as! onBoarding
                self.delegate = vc
                navigationController?.pushViewController(vc, animated: true)
        
                self.delegate?.navigateFromLaunchScreen(buttonPressed: "Login")
        
    }
    
    @IBAction func signUpPressed(_ sender: Any)  {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: onBoarding.ID)
        
        navigationController?.pushViewController(vc, animated: true)
        self.delegate?.navigateFromLaunchScreen(buttonPressed: "Sign Up")
    }
}

