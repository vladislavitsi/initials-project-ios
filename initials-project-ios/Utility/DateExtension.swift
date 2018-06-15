//
//  DateExtension.swift
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/15/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

import Foundation

extension NSDate {
    
    private static let DATE_FORMAT = "dd MMMM, yyyy"
    
    private static var dateFormatter: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate(DATE_FORMAT)
        return dateFormatter
    }()

    func getFormattedDate() -> String {
        return NSDate.dateFormatter.string(from: self as Date)
    }
    
    static func getDate(FromFormattedString string: String) -> NSDate {
        guard let date = NSDate.dateFormatter.date(from: string) as NSDate? else {
            assertionFailure("Invalid date conversion")
            return NSDate()
        }
        return date
    }
}
