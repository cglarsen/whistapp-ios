//
//  Extensions.swift
//  WhistApp
//
//  Created by Christian Graver on 14/01/2021.
//  Copyright © 2021 Gravr. All rights reserved.
//

import Foundation

// MARK: - Collection -
extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
