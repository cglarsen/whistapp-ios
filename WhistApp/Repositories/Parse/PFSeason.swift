//
//  PFSeason.swift
//  WhistApp
//
//  Created by Christian Graver on 07/12/2020.
//  Copyright © 2020 Gravr. All rights reserved.
//

import Foundation

import Parse

class PFSeason: PFObject {
    @NSManaged var name: String?
    @NSManaged var year: Int
}

extension PFSeason: PFSubclassing {
    static func parseClassName() -> String {
        return Constants.Parse.Objects.Season
    }
}
