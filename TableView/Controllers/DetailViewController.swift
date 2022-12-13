//
//  DetailViewController.swift
//  TableView
//
//  Created by DongMin Hwang on 2022/12/09.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //저장속성
    var movieData : Movie?
    
     override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
     }
    
    func setupUI() {
        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        descriptionLabel.text = movieData?.movieDescrtiption
    }
    
}
