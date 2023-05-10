//
//  exctensions.swift
//  E-Commerce
//
//  Created by mac on 27/04/2023.
//

import Foundation
import UIKit

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
            set {
                layer.borderWidth = newValue
            }
            get {
                return layer.borderWidth
            }
        }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
            set {
                guard let uiColor = newValue else { return }
                layer.borderColor = uiColor.cgColor
            }
            get {
                guard let color = layer.borderColor else { return nil }
                return UIColor(cgColor: color)
            }
        }
}

extension UITextField{
    
    @IBInspectable var underLineBorder:Bool {
        
        get{
            return false
        }
        
        set{
            if newValue {
                let underLineLayer = CALayer()
                underLineLayer.frame = CGRect(x: 0, y: self.frame.height-1, width: self.frame.width, height: 2)
                underLineLayer.backgroundColor = UIColor.init(named: "underlineColor")?.cgColor
                
                self.borderStyle = .none
                self.layer.addSublayer(underLineLayer)
            }
        }
        
    }
    
    @IBInspectable var eyeIcon:UIImage {
        
       
        set{
            
            let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width:newValue.size.width, height: newValue.size.height))
            
            iconView.image = newValue
//            let iconContainerView: UIView = UIView(frame:
//                              CGRect(x: 0, y: 0, width: 20, height: 20))
//            iconContainerView.addSubview(iconView)
            self.rightView = iconView
            self.rightViewMode = .always
            self.tintColor = UIColor.init(named: "underlineColor")
            self.addSubview(iconView)
            
            
        }
        get{
            return self.disabledBackground!
        }
        
        
    }
    
    
}

extension UIViewController {
    func navigate(_ storyBoard:String , _ ID:String) {
        let storyboard = UIStoryboard(name: storyBoard, bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: ID)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigate( _ ID:String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: ID)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func popScreen(){
        navigationController?.popViewController(animated: true)
    }
}


protocol directionImplement {
    func navigateFromLaunchScreen(buttonPressed:String)
}
