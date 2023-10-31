//
//  ImageOrLottieView.swift
//  SnapMatch
//
//  Created by Hoad Ad on 31/10/2023.
//

import Foundation
import UIKit
import Lottie

class ImageOrLottieView: UIView {
    
    var showImage: Bool = true {
        didSet {
            updateView()
        }
    }
    
    var image: UIImage? {
        didSet {
            showImage = true
            updateView()
        }
    }
    
    var lottieName: String? {
        didSet {
            showImage = false
            updateView()
        }
    }
    
    private let imageView = UIImageView()
    private let lottieView = LottieAnimationView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        imageView.contentMode = .scaleAspectFit
        lottieView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        addSubview(lottieView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        self.constrainToWholeViewFrame(subView: imageView)
        self.constrainToWholeViewFrame(subView: lottieView)
        self.backgroundColor = .none
        
        updateView()
    }
    
    private func updateView() {
        if showImage {
            imageView.layer.opacity = 1.0
            lottieView.layer.opacity = 0.0
            if let image = image {
                imageView.image = image
            }
        } else {
        
            imageView.layer.opacity = 0.0
            lottieView.layer.opacity = 1.0
            if let lottieName = lottieName {
                print("setting up lottie", lottieName)
                lottieView.animation =  LottieAnimation.named(lottieName)
                lottieView.loopMode = .loop
                lottieView.play()
            }
        }
    }
}
