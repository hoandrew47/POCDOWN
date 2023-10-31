//
//  TabBar.swift
//  SnapMatch
//
//  Created by Hoad Ad on 30/10/2023.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    // MARK: - LCMS
    override func viewDidLoad() {
        
            _setupTabBarApperance()
            _setupVCs()
 
    }
    

    
    // MARK: - METHODS
  
    
    /**
        Setup and customise the tabbbar
     */
    private func _setupTabBarApperance() {
        //TODO:- Consider dark mode set up
        view.backgroundColor = .black
        UITabBar.appearance().barTintColor = .darkGray
        tabBar.tintColor = UIColor.white
       
    }
    
    
    /**
        Setup  the view controllers that are attached to this TabBar
     */
    func _setupVCs() {
        
          viewControllers = [
            
            ViewControllerBuilder(rootViewController: HomeViewController())
                .setTabbarTitle(STRINGS.TAB_BAR.HOME_TAB)
                .setTabbarImage(ICONS.TAB_BAR.HOME_TAB)
                .setInNavController()
                .build(),
            
            ViewControllerBuilder(rootViewController: SnapMatchViewController())
                .setTabbarTitle(STRINGS.TAB_BAR.SNAP_TAB)
                .setTabbarImage(ICONS.TAB_BAR.SNAP_TAB)
                .build(),
        
          ]
        
      }
    

}
