//
//  MovieViewController.swift
//  VIPER-pattern
//
//  Created by Andaru on 18/07/23.
//  Copyright © 2023 Tootle. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import AVKit
import AVFoundation

class MovieViewController: UIViewController {

    var moviePresenter:ViewToPresenterMovieProtocol?
    
    @IBOutlet weak var myTableView: UITableView!
    var arrayList:Array<MovieModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Movie-Module"
        moviePresenter?.startFetchingMovie()
        showProgressIndicator(view: self.view)
        
        myTableView.delegate = self
        myTableView.dataSource = self

    }

    
    @IBAction func backButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}

extension MovieViewController:PresenterToViewMovieProtocol{
    
    func onMovieResponseSuccess(movieModelArrayList: Array<MovieModel>) {
        
        self.arrayList = movieModelArrayList
        self.myTableView.reloadData()
        hideProgressIndicator(view: self.view)
        
    }
    
    func onMovieResponseFailed(error: String) {
        
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Article", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension MovieViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        cell.mTitle.text = arrayList[indexPath.row].title
        cell.mDescription.text = arrayList[indexPath.row].brief

        // this things should be done in interactor where the business logid is done and should be send back to viewController
        Alamofire.request("https://image.tmdb.org/t/p/original" + self.arrayList[indexPath.row].imagesource!).responseData { (response) in
            if response.error == nil {
                print(response.result)
                                if let data = response.data {
                    cell.mImageView.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let url = URL(string : "https://www.youtube.com/embed/sd0BOnN6aNY/?controls=1&enablejsapi=1&modestbranding=1&showinfo=0&origin=https%3A%2F%2Fwww.khanacademy.org&iv_load_policy=3&html5=1&autoplay=1&fs=1&rel=0&hl=en&cc_lang_pref=en&cc_load_policy=1&start=20")!
        
        if UIApplication.shared.canOpenURL(url) == true  {
            UIApplication.shared.openURL(url)
        }
    }
    
    
}

class MovieCell:UITableViewCell{
    
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mDescription: UILabel!
    
}

