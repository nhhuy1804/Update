//
//  SeatCellCollectionView.swift
//  Mock-Cinema
//
//  Created by MrDummy on 6/12/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit

class SeatCellCollectionView: UICollectionViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    
    func setColorCell(id: String, status: Int) {
        
        lblName.text = id
        switch status {
            
        case 0:
            //seats can choose
            backgroundColor = UIColor.white
        case 1:
            //seat cannot choose
            backgroundColor = UIColor.orange
        case 2:
            //choosing
            backgroundColor = UIColor.green
        default:
            backgroundColor = UIColor.clear
        }
    }
}
