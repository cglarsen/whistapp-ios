//
//  SeasonsWorker.swift
//  WhistApp
//
//  Created by Christian Graver on 07/12/2020.
//  Copyright (c) 2020 Gravr. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

class SeasonsWorker {
    let service: SeasonRepository
    
    init(service: SeasonRepository) {
        self.service = service
    }
    
    func getSeasons(completion: @escaping (Response<[Season]>) -> Void) {
        service.getSeasons { (response) in
            completion(response)
        }
    }
    
    func createSeason(name: String, year: Int, completion: @escaping (Response<Season>) -> Void) {
        service.createSeason(name: name, year: year) { (response) in
            completion(response)
        }
    }
}
