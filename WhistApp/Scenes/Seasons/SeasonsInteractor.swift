//
//  SeasonsInteractor.swift
//  WhistApp
//
//  Created by Christian Graver on 07/12/2020.
//  Copyright (c) 2020 Gravr. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

protocol SeasonsBusinessLogic {
    func viewCreated(request: Seasons.Request.ViewCreated)
    func createSeason(request: Seasons.Request.CreateSeason)
}

protocol SeasonsDataStore {
    //var name: String { get set }
}

class SeasonsInteractor: SeasonsDataStore {
    var presenter: SeasonsPresentationLogic?
    var worker: SeasonsWorker?
    
    init(repository: SeasonRepository) {
        self.worker = SeasonsWorker(service: repository)
    }
}

extension SeasonsInteractor: SeasonsBusinessLogic {
    func createSeason(request: Seasons.Request.CreateSeason) {
        worker?.createSeason(name: request.name, year: request.year, completion: { (response) in
            switch response.result {
            case .success(let season):
                self.presenter?.presentNewSeason(response: season)
            case .failure(let error):
                print("CreateSeasons error in SeasonsInteractor: \(error)")
            }
        })
    }
    
    func viewCreated(request: Seasons.Request.ViewCreated) {
        worker?.getSeasons(completion: { (response) in
            switch response.result {
            case .success(let seasons):
                self.presenter?.presentSeasons(response: seasons)
            case .failure(let error):
                print("GetSeasons error in SeasonsInteractor: \(error)")
            }
        })
    }
}