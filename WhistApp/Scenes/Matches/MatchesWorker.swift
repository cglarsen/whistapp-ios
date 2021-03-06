//
//  MatchesWorker.swift
//  WhistApp
//
//  Created by Christian Graver on 14/01/2021.
//  Copyright (c) 2021 Gravr. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

class MatchesWorker {
    let service: MatchRepository
    
    init(service: MatchRepository) {
        self.service = service
    }
    
    func getMatches(for seasonId: String, completion: @escaping (Response<[Match]>) -> Void) {
        service.getMatches(for: seasonId, completion: { (response) in
            completion(response)
        })
    }
}
