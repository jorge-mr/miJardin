//
//  catalogueTableViewCell.swift
//  miJardin
//
//  Created by Jorge MR on 01/02/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class CatalogueTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
