//
//  MatchGamesInteractor.swift
//  WhistApp
//
//  Created by Christian Graver on 17/01/2021.
//  Copyright (c) 2021 Gravr. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

protocol MatchGamesBusinessLogic {
}

protocol MatchGamesDataStore {
    var match: Match? { get set }
}

class MatchGamesInteractor: MatchGamesDataStore {
    var match: Match?
    
    var presenter: MatchGamesPresentationLogic?
    var worker: MatchGamesWorker?
}

extension MatchGamesInteractor: MatchGamesBusinessLogic {
    
}
