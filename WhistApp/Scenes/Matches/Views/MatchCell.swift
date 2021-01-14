//
//  MatchCell.swift
//  WhistApp
//
//  Created by Christian Graver on 14/01/2021.
//  Copyright © 2021 Gravr. All rights reserved.
//

import UIKit

class MatchCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: Properties
    var match: Matches.DisplayData.Match?

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        nameLabel.font = .boldSystemFont(ofSize: 16.0)
        dateLabel.font = .italicSystemFont(ofSize: 12.0)
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(viewModel: Matches.DisplayData.Match) {
        self.match = viewModel
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.dateString
    }
}
