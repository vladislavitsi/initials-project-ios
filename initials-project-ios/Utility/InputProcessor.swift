//
//  InputProcessor.swift
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/15/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

import Foundation

@objc public class InputProcessor: NSObject {
    private let characterSet: CharacterSet
    private(set) var initials = [String]()
    
    init(withPattern pattern: String) {
        characterSet = CharacterSet.init(charactersIn: pattern)
    }
    
    func processInput(_ text: String) {
        let words = text.components(separatedBy: characterSet)
        for word in words {
            guard let char = word.first else {continue}
            initials.append(String(char).capitalized)
        }
    }
}

