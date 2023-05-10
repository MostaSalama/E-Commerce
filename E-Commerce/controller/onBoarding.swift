//
//  onBoarding.swift
//  E-Commerce
//
//  Created by mac on 27/04/2023.
//

import UIKit


class onBoarding: UIViewController,
                  UICollectionViewDataSource,
                  UICollectionViewDelegate,
                  UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate,directionImplement, UIGestureRecognizerDelegate  {
    
    
    
    
    
    var delegate:directionImplement?
    var onBoardingModel = boardingModel()
    @IBOutlet var arrowButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    static let ID = String(describing: onBoarding.self)
    var buttonNav = ""
    var timer : Timer?
    var currentCellIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrowButton.setTitle("", for: .normal)
        
        collectionView.delegate =  self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "onBoardingCell", bundle: nil), forCellWithReuseIdentifier: "onBoardingCell")
        pageControl.backgroundStyle = .prominent
        pageControl.numberOfPages = onBoardingModel.images.count
        startTimer()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveCell), userInfo: nil, repeats: true)
    }
    
    @objc func moveCell() {
        
        if currentCellIndex < onBoardingModel.images.count-1 {
            currentCellIndex += 1
        }else{
            currentCellIndex = 0
        }
        
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
        
        
    }
    
    func navigateFromLaunchScreen(buttonPressed: String) {
        
        buttonNav = buttonPressed
        print(buttonPressed)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardingModel.images.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "onBoardingCell", for: indexPath) as! onBoardingCell
        
        cell.setup(model: onBoardingModel, index: indexPath)

        return cell 
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: self.view.frame.width , height: self.view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
  
    
    @IBAction func arrowPressed(_ sender: Any) {
        
        arrowButton.titleLabel?.text = ""
        print(buttonNav)
        if buttonNav == "Login" {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: LoginViewController.ID)
            navigationController?.pushViewController(vc, animated: true)
            
        }else{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: SignUpViewController.ID)
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
 

}
