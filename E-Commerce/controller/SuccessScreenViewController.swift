//
//  SuccessScreenViewController.swift
//  E-Commerce
//
//  Created by mac on 05/05/2023.
//

import UIKit

class SuccessScreenViewController: UIViewController {

    static let ID = String(describing: SuccessScreenViewController.self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
        
        
        
    }
    
    
    @IBAction func startShopping(_ sender: Any) {
        navigate("HomePage", HomeViewController.ID)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
