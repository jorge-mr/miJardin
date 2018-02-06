//
//  FirstViewController.swift
//  miJardin
//
//  Created by Jorge MR on 01/02/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit
import Kingfisher

class FirstViewController: UIViewController{
    
    @IBOutlet var plantButton: [UIButton]!
    
    var cataloguePlants = [Plant]()
    var myGarden = [Plant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideContent()
        DispatchQueue.global(qos: .userInteractive).async {
            self.makeRequest()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeRequest(){
        let jsonString = "https://plantitasios.herokuapp.com/allPlants"
        guard let url = URL(string: jsonString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let plants = try JSONDecoder().decode([Plant].self, from: data)
                self.cataloguePlants.append(contentsOf: plants)
                DispatchQueue.main.async {
                    self.showContent()
                    for (index,plant) in self.cataloguePlants.enumerated() {
                        let imageUrl = URL(string: plant.image_link)!
                        ImageDownloader.default.downloadImage(with: imageUrl, options: [], progressBlock: nil) {
                            (image, error, url, data) in
                            self.plantButton[index].setImage(image, for: .normal)
                        }
                    }
                }
            } catch let error {
                print(error)
            }
            }.resume()
    }
    
    func showContent(){
        for button in plantButton {
            button.isHidden = false
        }
    }
    
    func hideContent(){
        for button in plantButton {
            button.isHidden = true
        }
    }

    @IBAction func addPlant(_ sender: UIButton) {
        myGarden.append(cataloguePlants[sender.tag - 1])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "myGardenSegue" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.cataloguePlants = myGarden
            destinationVC.barTitle = "Mi jardín"
        }
    }
    
}

