//
//  Season.swift
//  WhistApp
//
//  Created by Christian Graver on 07/12/2020.
//  Copyright © 2020 Gravr. All rights reserved.
//

import Foundation

struct Season {
    var id = ""
    var name = ""
    var year = 0
    
    init(parse season: PFSeason) {
        self.id = season.objectId ?? ""
        self.name = season.name ?? ""
        self.year = season.year
    }
}


