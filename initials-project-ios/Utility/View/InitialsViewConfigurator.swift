//
//  InitialsViewConfigurator.swift
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/15/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

import UIKit

@objc class InitialsViewConfigurator: NSObject {
    
    private static let SEGMENT_COUNT: Float = 20.0
    
    class func configurateView(_ view: UIView, width: Float, withConfiguration configuration: IPCreationConfiguration, initials: [String]) {
        var constraints = [NSLayoutConstraint]()
        
        let segment = width/SEGMENT_COUNT
        
        for i in 0..<initials.count {
            let letterLabel = UILabel()
            
            let pattern = configuration.options[0] as! Pattern
            let backgroundColor = configuration.options[1] as! IPColor
            let fontColor = configuration.options[2] as! IPColor
            let fontFamily = configuration.options[3] as! IPFont
            let letterSize = pattern.letterPatterns[i].size
            
            letterLabel.text = initials[i]
            letterLabel.font = UIFont.init(name: fontFamily.fontName, size: CGFloat(letterSize))
            letterLabel.textColor = fontColor.color
            letterLabel.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(letterLabel)
            view.backgroundColor = backgroundColor.color
            
            constraints.append(letterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: (CGFloat(segment * Float(pattern.letterPatterns[i].x)))))
            
            constraints.append(letterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (CGFloat(segment * Float(pattern.letterPatterns[i].y)))))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
}
