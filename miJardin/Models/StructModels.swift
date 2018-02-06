//
//  StructModels.swift
//  miJardin
//
//  Created by Jorge MR on 01/02/18.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation

struct Plant : Decodable {
    let care : Care
    let image_link : String
    let taxonomy : Taxonomy
}

struct Care : Decodable {
    let ground : String
    let irrigation : String
    let location : String
}

struct Taxonomy : Decodable {
    let common_name : String
    let scientific_name : String
    let family : String
    let kingdom : String
    let description : String
}































