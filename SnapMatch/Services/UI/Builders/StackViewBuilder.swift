//
//  StackViewBuilder.swift
//  SnapMatch
//
//  Created by Hoad Ad on 31/10/2023.
//

import Foundation
import UIKit

class StackBuilder {

    private var stackView: UIStackView
    
    init(axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 8, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fillEqually) {
        stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addArrangedSubview(_ view: UIView) -> StackBuilder {
        stackView.addArrangedSubview(view)
        return self
    }
    
    func setSpacing(_ spacing: CGFloat) -> StackBuilder {
        stackView.spacing = spacing
        return self
    }
    
    func setAlignment(_ alignment: UIStackView.Alignment) -> StackBuilder {
        stackView.alignment = alignment
        return self
    }
    
    func setDistribution(_ distribution: UIStackView.Distribution) -> StackBuilder {
        stackView.distribution = distribution
        return self
    }
    
    func build() -> UIStackView {
        return stackView
    }
}
