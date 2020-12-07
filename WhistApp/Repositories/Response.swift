//
//  Response.swift
//  WhistApp
//
//  Created by Christian Graver on 07/12/2020.
//  Copyright © 2020 Gravr. All rights reserved.
//

import Foundation

struct Response<Value> {
    
    /// The result of response serialization.
    public let result: Result<Value>
    
    /// Returns the associated value of the result if it is a success, `nil` otherwise.
    public var value: Value? { return result.value }

    /// Returns the associated error value if the result if it is a failure, `nil` otherwise.
    public var error: Error? { return result.error }
    
    init(result: Result<Value>) {
        self.result = result
    }
}
