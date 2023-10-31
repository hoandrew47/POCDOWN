//
//  View+Extensions.swift
//  SnapMatch
//
//  Created by Hoad Ad on 30/10/2023.
//

import Foundation
import UIKit

extension UIView {
    
    func constrainToWholeViewFrame(subView: UIView, paddingTop: CGFloat = 0, paddingBottom: CGFloat = 0, paddingLeft: CGFloat = 0, paddingRight: CGFloat = 0) {
          NSLayoutConstraint.activate([
              subView.topAnchor.constraint(equalTo: self.topAnchor, constant: paddingTop),
              subView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: paddingLeft),
              subView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -paddingBottom),
              subView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -paddingRight)
          ])
      }
 
    

    var height: CGFloat {
        return frame.size.height
    }

    var width: CGFloat {
        return frame.size.width
    }
    
}
