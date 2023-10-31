//
//  CGRect + Extensions.swift
//  SnapMatch
//
//  Created by Hoad Ad on 31/10/2023.
//

import Foundation


import CoreGraphics

extension CGRect {
    
    func halveRect() -> CGRect {
        return CGRect(
            x: self.origin.x + self.size.width / 4,
            y: self.origin.y + self.size.height / 4,
            width: self.size.width / 2,
            height: self.size.height / 2
        )
    }
}


