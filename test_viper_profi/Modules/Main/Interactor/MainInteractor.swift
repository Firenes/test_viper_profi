//
//  MainInteractor.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 24.10.2021.
//

class MainInteractor {
    weak var output: MainInteractorOutput!

    private var filmsManager: FilmsManager = {
        return FilmsManager.shared
    }()
    
    deinit {
        print("\(type(of: self)) - \(#function)")
    }
}

// MARK: - MainInteractorInput
extension MainInteractor: MainInteractorInput {
    func fetchData() {
        filmsManager.fetchData { [weak self] films in
            guard let self = self else { return }
            self.output.setData(data: films)
        }
    }
    
    func setFavorite(id: String, _ isFavorite: Bool) {
        filmsManager.setFavorite(id: id, isFavorite, completion: {
            fetchData()
        })
    }
}
