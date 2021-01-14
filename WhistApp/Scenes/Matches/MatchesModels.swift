//
//  MatchesModels.swift
//  WhistApp
//
//  Created by Christian Graver on 14/01/2021.
//  Copyright (c) 2021 Gravr. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

enum Matches {
    enum Request { }
    enum Response { }
    enum DisplayData { }
}

extension Matches.Request {
    struct ViewCreated {}
}

extension Matches.Response {
    
}

extension Matches.DisplayData {
    struct Match {
        let name: String
        let dateString: String
    }
}
