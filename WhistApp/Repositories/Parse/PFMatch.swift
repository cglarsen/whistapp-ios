//
//  PFMatch.swift
//  WhistApp
//
//  Created by Christian Graver on 14/01/2021.
//  Copyright © 2021 Gravr. All rights reserved.
//

import Foundation
import Parse

class PFMatch: PFObject {
    @NSManaged var name: String?
    @NSManaged var date: Date
    //@NSManaged var season: PFSeason don't think we need it
}

extension PFMatch: PFSubclassing {
    static func parseClassName() -> String {
        return Constants.Parse.Objects.Match
    }
}
