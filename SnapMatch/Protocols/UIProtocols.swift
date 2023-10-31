//
//  UIProtocols.swift
//  SnapMatch
//
//  Created by Hoad Ad on 31/10/2023.
//

import Foundation
import UIKit

protocol HasProgrammaticUI: AnyObject {
    /// A method that should be called to setup the UI components.
    func setupUI()
    
    /// A method that should be called to setup the constraints for UI components.
    func setupConstraints()
    
    /// A method to update the layout of the UI components if needed.
    func updateLayout()
    
    /// A method to setup additional configurations for UI components.
    func configureUI()
}

extension HasProgrammaticUI where Self: UIView {
  
    
    //OPTIONALS
    func setupConstraints(){}
    func updateLayout(){}
    func configureUI(){}
    
}

extension HasProgrammaticUI where Self: UIViewController {
    func setupUI() {
        // Default implementation can be empty or can provide log
        print("Setup UI elements for \(String(describing: Self.self))")
    }
    
    func setupConstraints() {
        // Default implementation can be empty or can provide log
        print("Setup constraints for UI elements in \(String(describing: Self.self))")
    }
    
    func updateLayout() {
        // Default implementation can be empty or can provide log
        print("Update layout for UI elements in \(String(describing: Self.self))")
    }
    
    func configureUI() {
        // Default implementation can be empty or can provide log
        print("Configure UI elements in \(String(describing: Self.self))")
    }
}
