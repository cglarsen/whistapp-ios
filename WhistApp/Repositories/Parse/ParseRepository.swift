//
//  ParseRepository.swift
//  WhistApp
//
//  Created by Christian Graver on 07/12/2020.
//  Copyright © 2020 Gravr. All rights reserved.
//

import Foundation
import Parse
class ParseRepository {
    
    // MARK: - Properties
    static let instance = ParseRepository()
    
    // MARK: - Lifecycle
    init() {
        let configuration = ParseClientConfiguration {
            $0.applicationId = Constants.Parse.applicationId
            $0.server = Constants.Parse.server
        }
        
        Parse.initialize(with: configuration)
    }
}

extension ParseRepository: SeasonRepository {
    func createSeason(name: String, year: Int, completion: @escaping (Response<Season>) -> Void) {
        var season = PFSeason()
        season.name = name
        season.year = year
        season.saveInBackground{ (succeeded, error)  in
            if (succeeded) {
                // The object has been saved.
                print("Parse: Season saved with id \(String(describing: season.objectId))")
                let savedSeason = Season(parse: season)
                let result = Result<Season>.success(savedSeason)
                let response = Response(result: result)
                completion(response)
            } else {
                print("Parse error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    func getSeasons(completion: @escaping (Response<[Season]>) -> Void) {
        let query = PFSeason.query()
        
        // Load data
        query?.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects as? [Season] {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) scores.")
            }
        }
    }
    
    func getSeason(id: String, completion: @escaping (Response<Season>) -> Void) {
        
    }
    
    func deleteSeason(id: String, completion: @escaping (Response<Season>) -> Void) {
        
    }
    
    func updateSeason(_ season: Season, completion: @escaping (Response<Season>) -> Void) {
        
    }
    
    
}
