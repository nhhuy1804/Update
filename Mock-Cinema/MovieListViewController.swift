//
//  MovieListViewController.swift
//  Mock-Cinema
//
//  Created by Cntt35 on 6/7/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit
import Firebase

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var loginLogoutBtn: UIButton!
    @IBOutlet weak var helloBtn: UIButton!
    @IBOutlet weak var tbvMovieList: UITableView!
    
    var movies = [Movie]()
    var posterImage: [Int:UIImage] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        //user is not login
        if Auth.auth().currentUser?.uid == nil {
            helloBtn.isHidden = true
            helloBtn.isEnabled = false
            loginLogoutBtn.setTitle("Login", for: .normal)
            
        } else {
            //user is login
            helloBtn.isHidden = false
            helloBtn.isEnabled = true
            loginLogoutBtn.setTitle("Logout", for: .normal)
            
        }
        getMovies()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLoginLogout(_ sender: Any) {
        if Auth.auth().currentUser?.uid != nil {
            // //user is login
            do {
                try Auth.auth().signOut()
            } catch let logoutError {
                print(logoutError)
            }
            
            helloBtn.isHidden = true
            helloBtn.isEnabled = false
            loginLogoutBtn.setTitle("Login", for: .normal)
        } else {
            // //user is not login
            let srcLogin = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
            self.present(srcLogin, animated: true)
        }
    }

    @IBAction func btnHello(_ sender: Any) {
        let srcUserInfo = self.storyboard?.instantiateViewController(withIdentifier: "userProfile") as! UserProfileViewController
        self.present(srcUserInfo, animated: true)
    }
    
    // get list movies
    func getMovies() {
        let ref = Database.database().reference()
        ref.child("movie").observe(.childAdded, with: {snapshot in
            
            let snapshotValue = snapshot.value as? NSDictionary
            self.movies.append(Movie(json: snapshotValue as! [String : Any]))
            DispatchQueue.main.async {
                self.tbvMovieList.reloadData()
            }
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieListTableViewCell
        let movie: Movie
        
        movie = movies[indexPath.row]
        cell.imgPoster.image = #imageLiteral(resourceName: "loadingImage")
        OperationQueue().addOperation { () -> Void in
            if let img = Downloader.downloadImageWithURL(movie.posterURL) {
                OperationQueue.main.addOperation({
                    self.posterImage[self.movies[indexPath.row].id!] = img
                    cell.imgPoster?.image = img
                })
            }
        }
        
        cell.lblTitle?.text = movie.title
        cell.lblOverview?.text = movie.overview
        
        return cell
    }
    
}
