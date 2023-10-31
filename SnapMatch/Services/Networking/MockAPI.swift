//
//  MockAPI.swift
//  SnapMatch
//
//  Created by Hoad Ad on 31/10/2023.
//

import Foundation
import MapKit

struct MockAPI{
    
    static func callSnapMatchWithCordinates(coordinates: CLLocationCoordinate2D, completion: @escaping (Bool) -> Void) {
        
        DispatchQueue.global().async {
                print("Mock API Call Started")
                // Simulate network delay of 5 seconds
                sleep(5)
                print("Mock API Call Ended")
                // Responding with true after 5 seconds
                completion(true)
            }
        
        
    }
    
    
}
