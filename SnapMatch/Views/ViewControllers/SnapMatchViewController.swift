//
//  SnapMatchViewController.swift
//  SnapMatch
//
//  Created by Hoad Ad on 30/10/2023.
//

import UIKit
import MapKit

class SnapMatchViewController: UIViewController, HasProgrammaticUI {
    
    //MARK: - UI
    var mapView: MKMapView!
    var searcherView: SearcherView!
    let bottomSheetVC = MapBottomSheetViewController()
    
    
    //MARK: - ViewModels
    
    lazy private var mapViewModel: MapManagerViewModel =  MapManagerViewModel(mapView: mapView)
    lazy private var snapViewModel: SnapMatchStateViewModel = SnapMatchStateViewModel(delegate: self)
    
    
    // MARK: - LCM
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
     

    }
    
   

   // MARK: - FUNC
    
    func setupUI() {
        _setUpMapView()
        _setUpBottomSheet()
        _setUpSearcherView()
    }
    
    private func _setUpMapView() {
        
        guard mapView == nil else {
            return
        }
        
        mapView = MKMapView(frame: view.bounds)
        mapView.translatesAutoresizingMaskIntoConstraints = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
        view.constrainToWholeViewFrame(subView: mapView)
        mapViewModel.setCordinates()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mapTapped(_:)))
        mapView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func _setUpBottomSheet(){
      
        bottomSheetVC.snapViewModelInstance = snapViewModel
      
        
        if let sheetController = bottomSheetVC.presentationController as? UISheetPresentationController {
                    // Configure the height of the sheet
                    sheetController.detents = [Dimensions.bottomSheetSmallHeight]
                    // Enable grabbing the sheet to pull it up and down
                    sheetController.prefersGrabberVisible = true
                }
                present(bottomSheetVC, animated: true)
        
    }
    
    private func _setUpSearcherView(){
        
        
        searcherView = SearcherView(frame: CGRect(x: view.bounds.midX - 250, y:  view.bounds.midY - 250 , width: 500, height: 500))
        searcherView.setUpImageView(with: ICONS.USERS.USER_1)
        view.addSubview(searcherView)
        view.constrainToWholeViewFrame(subView: searcherView)
        searcherView.isHidden = true
        
        
    }
    
    
    @objc func mapTapped(_ sender: UITapGestureRecognizer) {
        
        let touchPoint = sender.location(in: mapView)
        let coordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)

        _setUpBottomSheet()
        searcherView.isHidden = false
        snapViewModel.startSnapMatching(coordinates: coordinates)
         
         
      }
                   

}


extension SnapMatchViewController: SnapMatchViewModelDelegate {
    func changeOverSnapMatchImage() {
        DispatchQueue.main.async { [weak self] in
            self?.searcherView.changeOverImage()
        }
    }
    
    
    
    func movedToStep(stepIDX: Int) {
        bottomSheetVC.configureUI()
    }
    
    
    
    
}
