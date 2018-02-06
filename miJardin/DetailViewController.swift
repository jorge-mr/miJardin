//
//  DetailViewController.swift
//  
//
//  Created by Jorge MR on 01/02/18.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var groundLabel: UILabel!
    @IBOutlet weak var irrigationLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var commonNameLabel: UILabel!
    @IBOutlet weak var scientificNameLabel: UILabel!
    @IBOutlet weak var kingdomLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var plant : Plant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groundLabel.text = plant.care.ground
        irrigationLabel.text = plant.care.irrigation
        locationLabel.text = plant.care.location
        commonNameLabel.text = plant.taxonomy.common_name
        scientificNameLabel.text = plant.taxonomy.scientific_name
        kingdomLabel.text = plant.taxonomy.kingdom
        familyLabel.text = plant.taxonomy.family
        descriptionTextView.text = plant.taxonomy.description
        let url = URL(string: plant.image_link)!
        backgroundImageView.kf.setImage(with: url)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
