//
//  MovieListTableViewCell.swift
//  Mock-Cinema
//
//  Created by MrDummy on 6/8/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
