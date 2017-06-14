//
//  Seat.swift
//  Mock-Cinema
//
//  Created by MrDummy on 6/12/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import Foundation

class Seat {
    
    var id: String?
    var col: Int?
    var row: Int?
    var status: Int?
    
    init(json: [String:Any]) {
        id = json["id"] as? String
        col = json["col"] as? Int
        row = json["row"] as? Int
        status = json["status"] as? Int
    }
}
