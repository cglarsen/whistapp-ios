//
//  AddGameInteractor.swift
//  WhistApp
//
//  Created by Christian Graver on 17/01/2021.
//  Copyright (c) 2021 Gravr. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

protocol AddGameBusinessLogic {
}

protocol AddGameDataStore {
    //var name: String { get set }
}

class AddGameInteractor: AddGameDataStore {
    var presenter: AddGamePresentationLogic?
    var worker: AddGameWorker?
}

extension AddGameInteractor: AddGameBusinessLogic {
    
}