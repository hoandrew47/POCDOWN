//
//  SnapMatchStateViewModel.swift
//  SnapMatch
//
//  Created by Hoad Ad on 31/10/2023.
//

import Foundation
import MapKit


class SnapMatchStateViewModel {
    
    private var timer: Timer?
    // MARK: - PUBLIC API
    func getCurrentStep() -> Int {
        return currentStateIDX
    }
    
    func getCurrentStepData() -> SnapMatchState{
        return SnapMatchData.snapSteps[currentStateIDX]
        
    }
    
    func startSnapMatching(coordinates: CLLocationCoordinate2D){
        currentStateIDX = 1
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
                    self?.delegate.changeOverSnapMatchImage()
                }
        
        
        MockAPI.callSnapMatchWithCordinates(coordinates: coordinates) { [weak self] sucess in
            
        
            
            
            DispatchQueue.main.async { [weak self] in
                self?.currentStateIDX = 2
                self?.timer?.invalidate()
                self?.timer = nil
            }
        }
        
    }
    
//    func moveToNextState() {
//        if currentStateIDX > 3 {
//            currentStateIDX = 0
//        } else {
//            currentStateIDX += 1
//        }
//    }
    
    
    
    // MARK: - Inputs
    var delegate: SnapMatchViewModelDelegate
    
    
    
    // MARK: - Vars
    private var currentStateIDX =  0 {
        didSet{
            delegate.movedToStep(stepIDX: currentStateIDX)
        }
    }
    
    
    // MARK: - Inputs
    
    init(delegate: SnapMatchViewModelDelegate) {
        self.delegate = delegate
    }
    
    
    
    
    
    
}
