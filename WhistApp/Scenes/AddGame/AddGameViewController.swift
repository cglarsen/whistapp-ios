//
//  AddGameViewController.swift
//  WhistApp
//
//  Created by Christian Graver on 17/01/2021.
//  Copyright (c) 2021 Gravr. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

protocol AddGameDisplayLogic: class {
}

class AddGameViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var playerCollectionView: UICollectionView! {
        didSet {
            playerCollectionView.dataSource = self
            playerCollectionView.delegate  = self
        }
    }
    @IBOutlet weak var playerRoleButton: UIButton!
    @IBOutlet weak var playerClearButton: UIButton! {
        didSet {
            playerClearButton.setTitle("Clear", for: UIControl.State())
        }
    }
    
    // MARK: - Properties
    var interactor: AddGameBusinessLogic?
    var router: (NSObjectProtocol & AddGameRoutingLogic & AddGameDataPassing)?
    let playerRoles = ["Melder", "Makker", "Rival 1", "Rival 2"]
    var roleState = ""
    
    var players = ["Nico", "Jens", "Jesper", "Christian", "Kasper", "Lama", "Mads"]
    
    // MARK: - Init
    class func instantiate() -> AddGameViewController {
        let name = "\(AddGameViewController.self)"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: name) as! AddGameViewController
        vc.setup()
        return vc
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = AddGameInteractor()
        let presenter = AddGamePresenter()
        let router = AddGameRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Actions
    @IBAction func playerRolePressed(_ sender: UIButton) {
        
    }
    
    // MARK: - Misc
    private func setupView() {
        if let role = playerRoles.first {
            roleState = role
            playerRoleButton.setTitle(roleState, for: UIControl.State())
            
        }
    }
    
    private func nextRole() {
        if let currentRole = playerRoleButton.title(for: UIControl.State()),
           let currentIndex = playerRoles.firstIndex(where: { (role) -> Bool in
            return role == currentRole
           }) {
            roleState = currentIndex == playerRoles.count - 1 ? playerRoles.first! : playerRoles[currentIndex + 1]
            playerRoleButton.setTitle(roleState, for: UIControl.State())
        }
    }
}

extension AddGameViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! AddGamePlayerCell
        cell.roleLabel.text = roleState
        nextRole()
        
        print("You selected cell #\(indexPath.item)!")
    }
    
}

extension AddGameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddGamePlayerCell", for: indexPath as IndexPath) as! AddGamePlayerCell
        cell.playerLabel.text = players[indexPath.row]
        cell.backgroundColor = UIColor.systemIndigo
        return cell
    }
    
    
}

// MARK: - AddGameDisplayLogic
extension AddGameViewController: AddGameDisplayLogic {
    
}
