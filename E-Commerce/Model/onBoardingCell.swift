//
//  onBoardingCell.swift
//  E-Commerce
//
//  Created by mac on 28/04/2023.
//

import UIKit

class onBoardingCell: UICollectionViewCell {
    
    
    static let ID = String(describing: onBoardingCell.self)
    @IBOutlet var image: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var text: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(model:boardingModel,index:IndexPath){
        self.image?.image = UIImage(named: model.images[index.row])
        self.label?.text = model.label[index.row]
        self.text?.text = model.text
    }

}
