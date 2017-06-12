//
//  Meal.swift
//  hello-world
//
//  Created by siarhei on 12.06.17.
//  Copyright © 2017 Siarhei Knebeleu. All rights reserved.
//

import UIKit

class Meal {
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    
    
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // fail if nil or negative properties.
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
