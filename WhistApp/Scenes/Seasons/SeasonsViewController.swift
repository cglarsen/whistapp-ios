//
//  SeasonsViewController.swift
//  WhistApp
//
//  Created by Christian Graver on 07/12/2020.
//  Copyright (c) 2020 Gravr. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit

protocol SeasonsDisplayLogic: class {
    func displaySeasons(viewModel: [Seasons.DisplayData.Season])
    func displayNewSeason(viewModel: Seasons.DisplayData.Season)
}

class SeasonsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var seasonsTableView: UITableView! {
        didSet {
            seasonsTableView.dataSource = self
            seasonsTableView.delegate = self
            seasonsTableView.register(UINib(nibName: "SeasonCell", bundle: nil), forCellReuseIdentifier: "SeasonCell")
            seasonsTableView.separatorStyle = .none
            seasonsTableView.backgroundColor = .clear
        }
    }
    
    // MARK: - Properties
    var interactor: SeasonsBusinessLogic?
    var router: (NSObjectProtocol & SeasonsRoutingLogic & SeasonsDataPassing)?
    var seasons: [Seasons.DisplayData.Season] = []
    
    // MARK: - Init
    class func instantiate() -> SeasonsViewController {
        let name = "\(SeasonsViewController.self)"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: name) as! SeasonsViewController
        vc.setup()
        return vc
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = SeasonsInteractor(repository: ParseRepository.instance)
        let presenter = SeasonsPresenter()
        let router = SeasonsRouter()
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
        interactor?.viewCreated(request: .init())
    }
    
    // MARK: - Actions
    @IBAction func createSeasonPressed(_ sender: Any) {
        let newSeason = Seasons.Request.CreateSeason(name: "New season",
                                                     year: 1000)
        interactor?.createSeason(request: newSeason)
    }
    
    // MARK: - Misc
    private func setupView() {
        self.title = "Seasons"
    }
}

// MARK: - SeasonsDisplayLogic
extension SeasonsViewController: SeasonsDisplayLogic {
    func displayNewSeason(viewModel: Seasons.DisplayData.Season) {
        
    }
    
    func displaySeasons(viewModel: [Seasons.DisplayData.Season]) {
        seasons = viewModel
        seasonsTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension SeasonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.seasonCellSelected(index: indexPath.row)
    }
}

// MARK: - UITableViewDataSource
extension SeasonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let seasonCell = tableView.dequeueReusableCell(withIdentifier: "SeasonCell", for: indexPath) as? SeasonCell,
           let season = seasons[safe: indexPath.row] {
           seasonCell.setup(viewModel: season)
            seasonCell.selectionStyle = .none
            cell = seasonCell
        }
        return cell
    }
}

