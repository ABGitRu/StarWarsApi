//
//  DetailViewController.swift
//  StarWarsApi
//
//  Created by Mac on 13.06.2021.
//

import UIKit

class DetailViewController: UIViewController {
    var details: Result?
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var directorLabel: UILabel!
    @IBOutlet private var producerLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        guard let detail = details else { return }
        titleLabel.text = "Title: \(detail.title)"
        directorLabel.text = "Director: \(detail.director)"
        producerLabel.text = "Producer: \(detail.producer)"
        dateLabel.text = "Release Date: \(detail.releaseDate)"
        descriptionLabel.text = "Description: \(detail.openingCrawl)"
    }

}
