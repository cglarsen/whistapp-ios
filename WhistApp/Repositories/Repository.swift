//
//  Repository.swift
//  WhistApp
//
//  Created by Christian Graver on 07/12/2020.
//  Copyright © 2020 Gravr. All rights reserved.
//

import Foundation

protocol SeasonRepository {
    func getSeasons(completion: @escaping (Response<[Season]>) -> Void)
    func getSeason(id: String, completion: @escaping (Response<Season>) -> Void)
    func deleteSeason(id: String,completion: @escaping (Response<Season>) -> Void)
    func updateSeason(_ season: Season, completion: @escaping (Response<Season>) -> Void)
    func createSeason(name: String, year: Int, completion: @escaping (Response<Season>) -> Void)
}
