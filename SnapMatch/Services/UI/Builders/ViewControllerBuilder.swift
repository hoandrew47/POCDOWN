//
//  ViewControllerBuilder.swift
//  SnapMatch
//
//  Created by Hoad Ad on 30/10/2023.
//

import Foundation
import UIKit

class ViewControllerBuilder {
    private var rootViewController: UIViewController
    private var title: String?
    private var image: UIImage?
    private var sitsInNavController: Bool = false
    private var isDarkMode = true
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    
    func setTabbarTitle(_ title: String) -> ViewControllerBuilder {
        self.title = title
        return self
    }
    
    func setTabbarImage(_ image: UIImage) -> ViewControllerBuilder {
        self.image = image
        return self
    }
    
    func setInNavController() -> ViewControllerBuilder {
        sitsInNavController = true
        return self
    }
    
    
    
    func build() -> UIViewController {
        
        var bufferController = rootViewController
        
        if (sitsInNavController) {
            
            // Set up a Nav controller and assign the root
            bufferController = UINavigationController(rootViewController: rootViewController)
            (bufferController as! UINavigationController).navigationBar.prefersLargeTitles = true
            rootViewController.navigationItem.title = self.title
            
            
            // Set up the title colours
            let textColor: UIColor = isDarkMode ? .white : .black
            (bufferController as! UINavigationController).navigationBar.titleTextAttributes = [.foregroundColor: textColor]
              //NOTE: Needed for Large titles too
              if #available(iOS 11.0, *) {
                  (bufferController as! UINavigationController).navigationBar.largeTitleTextAttributes = [.foregroundColor: textColor]
              }
                
          
        }
        
        if let tabTitle = title {
            bufferController.tabBarItem.title = tabTitle
        }
        
        if let tabImage = image {
            bufferController.tabBarItem.image = tabImage
        }

        return bufferController
    }
}
