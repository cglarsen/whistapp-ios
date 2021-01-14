//
//  Match.swift
//  WhistApp
//
//  Created by Christian Graver on 14/01/2021.
//  Copyright © 2021 Gravr. All rights reserved.
//

import Foundation

struct Match {
    var id = ""
    var name = ""
    var date = Date()
//    var season: Season?
    
    init(parse match: PFMatch) {
        self.id = match.objectId ?? ""
        self.name = match.name ?? ""
        self.date = match.date
//        self.season = .init(parse: match.season)
    }
}
