//
//  MainViewModel.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 24.10.2021.
//

import Foundation
import UIKit

protocol MainViewModelDelegate: AnyObject {
    func setFavorite(id: String, _ isFavorite: Bool)
}

class MainViewModel {
    weak var delegate: MainViewModelDelegate?
    
    private(set) var item: Films
    
    init(item: Films) {
        self.item = item
    }
    
    var id: String {
        return item.id
    }
    
    var title: String {
        return item.title
    }
    
    var director: String {
        return item.director
    }
    
    var description: String {
        return item.description
    }
    
    var country: String {
        return item.country
    }
    
    var year: Int {
        return item.year
    }
    
    var image: UIImage {
        if let _ = item.image {
            return UIImage()
        }
        return UIImage()
//        return UIImage(systemName: "film") ?? UIImage()
//        return UIImage(imageLiteralResourceName: "film")
//        return UIImage.init(named: "film") ?? UIImage()
    }
    
    var isFavorite: Bool {
        return item.isFavorite
    }
    
    var subtitle: String {
        return "\(director), \(country), \(year)"
    }
}

extension MainViewModel {
    func setIsFavorite() {
        delegate?.setFavorite(id: id, !isFavorite)
    }
}

extension MainViewModel: Equatable {
    static func == (lhs: MainViewModel, rhs: MainViewModel) -> Bool {
        return lhs.id == rhs.id
            && lhs.isFavorite == rhs.isFavorite
    }
}
