//
//  Coordinator.swift
//  WhistApp
//
//  Created by Christian Graver on 07/12/2020.
//Copyright © 2020 Gravr. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var children: [Coordinator] { get set }
    func start()
}
