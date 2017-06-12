//
//  hello_worldTests.swift
//  hello-worldTests
//
//  Created by siarhei on 08.06.17.
//  Copyright © 2017 Siarhei Knebeleu. All rights reserved.
//

import XCTest
@testable import hello_world

class hello_worldTests: XCTestCase {
    
   //MARK: Meal class tests
    
    // confirm that the meal initializer return a meal object when passed valid parameter
    func testMealInitializationSucceds() {
        
        // zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // confirm that the meal innitializer return nil when passed a negative rating or empty name
    func testMealInitializationFails() {
        
        // negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        // empty string
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }
}
