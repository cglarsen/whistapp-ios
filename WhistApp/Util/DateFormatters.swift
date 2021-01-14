//
//  DateFormatters.swift
//  WhistApp
//
//  Created by Christian Graver on 14/01/2021.
//  Copyright © 2021 Gravr. All rights reserved.
//

import Foundation

enum Formatters {
    static let humanDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "dd/MM yyyy"
        return formatter
    }()
}
