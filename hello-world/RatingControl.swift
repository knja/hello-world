//
//  RatingControl.swift
//  hello-world
//
//  Created by siarhei on 11.06.17.
//  Copyright © 2017 Siarhei Knebeleu. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    
    var rating = 0 {
        didSet{
            updateButtonSelectionStates()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 40.0, height: 40.0){
        didSet  {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet {
            setupButtons()
        }
    }
    

    //MARK:Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder){
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else{
        fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        //calculate rating of slected button
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        }
        else{
            rating = selectedRating
        }
    }
    
    //MARK: Private Methods
    
    private func setupButtons(){
        // clear any button
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // load buttons images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        for index in 0..<starCount{
            
            //Create the button
            let button = UIButton()
            
            // set button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            

            // Ad constrains
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // add accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"
        
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
            // Add button to stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
    
    private func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerated(){
            button.isSelected = index < rating
            
            // set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            
            // calculate the value string
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "no rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            // assign the value and rating strings
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
            
        }
    }
}
