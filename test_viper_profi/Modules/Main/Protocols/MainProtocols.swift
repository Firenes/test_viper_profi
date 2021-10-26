//
//  MainProtocols.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 24.10.2021.
//

import Foundation

// MARK: - View
protocol MainViewInput: AnyObject {
    // MARK: PRESENTER -> VIEW
    func setupInitialState()
    
    func setData(data: [MainViewModel])
}

protocol MainViewOutput {
    // MARK: VIEW -> PRESENTER
    func viewIsReady()
}


// MARK: - Interactor
protocol MainInteractorInput {
    // MARK: PRESENTER -> INTERACTOR
    func fetchData()
    
    func setFavorite(id: String, _ isFavorite: Bool)
}

protocol MainInteractorOutput: AnyObject {
    // MARK: INTERACTOR -> PRESENTER
    func setData(data: [Films])
}


// MARK: - Router
protocol MainRouterInput {
    // MARK: PRESENTER -> ROUTER
    
}


// MARK: - Presenter (Module)
protocol MainModuleInput: AnyObject {
    // MARK: IN -> PRESENTER

}

protocol MainModuleOutput: AnyObject  {
    // MARK: PRESENTER -> OUT
}
