//
//  MapBottomSheetViewController.swift
//  SnapMatch
//
//  Created by Hoad Ad on 30/10/2023.
//

import UIKit

class MapBottomSheetViewController: UIViewController, HasProgrammaticUI {
    
    
    // MARK: - Inputs
    public var snapViewModelInstance: SnapMatchStateViewModel?
    public var delegate: MapViewBottomSheetDelegate?
    
    // MARK: - UI
    var iconImageView: ImageOrLottieView!
    var titleView: UILabel!
    var subTitleView: UILabel!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureUI()
    }
    
    
    // MARK: - FUNCS
    
    func setupUI() {
        
        // Add subviews and set up their properties
        iconImageView = ImageOrLottieView()
        
        
        titleView = UILabel()
        titleView.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleView.textColor = .systemPink
        titleView.textAlignment = .center
        
        
        subTitleView = UILabel()
        subTitleView.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        subTitleView.textColor = .white
        subTitleView.textAlignment = .center
        
        let stackView = StackBuilder()
                  .addArrangedSubview(iconImageView)
                  .addArrangedSubview(titleView)
                  .addArrangedSubview(subTitleView)
                  .setSpacing(5)
                  .setDistribution(.fill)
                  .build()
        
        view.addSubview(stackView)
        view.constrainToWholeViewFrame(subView: stackView,
                                       paddingTop: 20.0,
                                       paddingBottom: 40.0,
                                       paddingLeft: 40.0,
                                       paddingRight: 40.0)
        
        
        //Set the relative heights of the stack items
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.5)
            ])
        
       
     }
     
    func configureUI() {
        guard let currentState = snapViewModelInstance?.getCurrentStepData()  else { return }
        
        titleView.text = currentState.title
        subTitleView.text = currentState.subTitle
        
       
        if currentState.prefersImage{
            iconImageView.image = currentState.uiImage
        } else {
            iconImageView.lottieName = currentState.lottieAnimationName
        }
        
      
    }
  
    
  

}



