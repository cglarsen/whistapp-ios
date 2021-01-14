//
//  SeasonCell.swift
//  WhistApp
//
//  Created by Christian Graver on 04/01/2021.
//  Copyright © 2021 Gravr. All rights reserved.
//

import UIKit

class SeasonCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearDescLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    // MARK: Properties
    var season: Seasons.DisplayData.Season?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .clear
        nameLabel.font = .boldSystemFont(ofSize: 12)
        yearDescLabel.font = .systemFont(ofSize: 12)
        yearLabel.font = .systemFont(ofSize: 12)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(viewModel: Seasons.DisplayData.Season) {
        self.season = viewModel
        nameLabel.text = viewModel.name
        yearLabel.text = "\(viewModel.year)"
    }
}
