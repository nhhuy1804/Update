//
//  MovieDetailViewController.swift
//  Mock-Cinema
//
//  Created by MrDummy on 6/10/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblReleaseInformation: UILabel!
    @IBOutlet weak var lblOriginalLanguage: UILabel!
    @IBOutlet weak var lblBudget: UILabel!
    @IBOutlet weak var lblRunTime: UILabel!
    
    var image: UIImage?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovieDetail()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBookTicketNow(_ sender: Any) {
    }

    func loadMovieDetail() {
        //imgPoster.image = image
        if let img = Downloader.downloadImageWithURL(movie?.posterURL) {
            OperationQueue.main.addOperation({
                self.imgPoster.image = img
            })
        }
        lblTitle.text = movie?.title?.uppercased()
        lblOverview.text = "Overview: " + (movie?.overview)!
        lblReleaseInformation.text = "Release Information: " + (movie?.releaseInformation)!
        lblOriginalLanguage.text = "Original Languege: " + (movie?.originalLanguage)!
        lblBudget.text = "Budget: " + (movie?.budget)!
        lblRunTime.text = "Run Time: " + (movie?.runTime)!
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil )
    }
    
}
