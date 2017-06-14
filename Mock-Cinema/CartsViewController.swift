//
//  CartsViewController.swift
//  Mock-Cinema
//
//  Created by Cntt35 on 6/14/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit

class CartsViewController: UIViewController {

    @IBOutlet weak var tbvCart: UITableView!
    
    var carts = [Carts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCellTableView
        
        
        return cell
    }
}
