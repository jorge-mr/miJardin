//
//  SecondViewController.swift
//  miJardin
//
//  Created by Jorge MR on 01/02/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit
import Kingfisher

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var cataloguePlants = [Plant]()
    var barTitle = "Catálogo"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = barTitle
        if barTitle == "Catálogo" {
            DispatchQueue.global(qos: .userInteractive).async {
                self.makeRequest()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.title = barTitle
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cataloguePlants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogueID", for: indexPath) as! CatalogueTableViewCell
        print(cataloguePlants[indexPath.row].image_link)
        cell.titleLabel.text = cataloguePlants[indexPath.row].taxonomy.common_name
        let url = URL(string: cataloguePlants[indexPath.row].image_link)!
        cell.backgroundImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destinationVC = segue.destination as! DetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            destinationVC.plant = cataloguePlants[indexPath.row]
        }
    }

}

