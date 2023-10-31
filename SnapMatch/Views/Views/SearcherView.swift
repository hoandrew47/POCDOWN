//
//  SearcherView.swift
//  SnapMatch
//
//  Created by Hoad Ad on 31/10/2023.
//

import Foundation
import UIKit


class SearcherView: UIView, HasProgrammaticUI {
    var imageView: UIImageView!
    var lottieView: ImageOrLottieView!
    
    
    public func setUpImageView(with image:UIImage){
        
        imageView.image = image
        lottieView.lottieName = ANIMATIONS.SEARCH
    }
    
    public func changeOverImage(){
        if imageView.image == ICONS.USERS.USER_1 {
            imageView.image = ICONS.USERS.USER_2
        } else {
            imageView.image = ICONS.USERS.USER_1
        }
    }

    init() {
        super.init(frame: .zero)
        setupUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setupUI() {
        setupLottieAnimation()
        setupImageView()
    }
    
    
    
    private func setupLottieAnimation() {
        lottieView = ImageOrLottieView(frame: self.frame)
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lottieView)
        self.constrainToWholeViewFrame(subView: lottieView)

       
    }

    private func setupImageView() {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        addSubview(imageView)
        self.constrainToWholeViewFrame(subView: imageView,
                                       paddingTop: 200,
                                       paddingBottom: 200,
                                       paddingLeft: 200,
                                       paddingRight: 200
        )
    }
    
    
   
}
