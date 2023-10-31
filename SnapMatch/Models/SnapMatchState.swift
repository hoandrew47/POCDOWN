//
//  SnapMatchState.swift
//  SnapMatch
//
//  Created by Hoad Ad on 31/10/2023.
//

import Foundation
import UIKit


class SnapMatchState {
    //Text
    let title: String
    let subTitle: String
    
    //Images
    let prefersImage: Bool
    let uiImage: UIImage
    let lottieAnimationName: String?
    
    init(title: String, subTitle: String, prefersImage: Bool, uiImage: UIImage, lottieAnimationName: String?) {
        self.title = title
        self.subTitle = subTitle
        self.prefersImage = prefersImage
        self.uiImage = uiImage
        self.lottieAnimationName = lottieAnimationName
    }
}
