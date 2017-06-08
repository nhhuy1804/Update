//
//  Download.swift
//  Mock-Cinema
//
//  Created by MrDummy on 6/8/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import Foundation
import UIKit

class Downloader {
    
    class func downloadImageWithURL(_ url: String?) -> UIImage? {
        let data : Data
        do {
            data = try Data(contentsOf: URL(string: url!)!)
            return UIImage(data: (data))
        }catch {
            return nil
        }
    }
}
