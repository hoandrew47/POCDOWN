//
//  SnapMatchData.swift
//  SnapMatch
//
//  Created by Hoad Ad on 31/10/2023.
//

import Foundation


struct SnapMatchData{
    
    static let snapSteps: [SnapMatchState] = [SnapMatchState(title: "Tap To Match",
                                                             subTitle: "Start chatting with people worldwide",
                                                             prefersImage: false,
                                                             uiImage: ICONS.SNAP_MATCH.TOUCH,
                                                             lottieAnimationName: ANIMATIONS.tap),
                                              SnapMatchState(title: "Hang Tight",
                                                               subTitle: "Matching you with someone..",
                                                               prefersImage: true,
                                                                uiImage: ICONS.SNAP_MATCH.PIN,
                                                               lottieAnimationName: nil),
                                              
                                              SnapMatchState(title: "Yay",
                                                               subTitle: "Here's your match",
                                                               prefersImage: true,
                                                                uiImage: ICONS.SNAP_MATCH.PIN,
                                                               lottieAnimationName: nil),
    
    
    
    ]
    
}
