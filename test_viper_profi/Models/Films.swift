//
//  Films.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 26.10.2021.
//

import Foundation

struct Films {
    var id: String
    var title: String
    var description: String
    var director: String
    var country: String
    var year: Int
    
    // url for downloading image
    var image: String?
    
    var isFavorite: Bool
}

