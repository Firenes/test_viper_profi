//
//  MainPresenter.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 24.10.2021.
//

class MainPresenter {
    weak var output: MainModuleOutput?
    weak var view: MainViewInput!
    var router: MainRouterInput!
    var interactor: MainInteractorInput!
    
    private var _viewModels: [MainViewModel]? {
        didSet {
            guard let viewModel = _viewModels else { return }

            view.setData(data: viewModel)
        }
    }

    deinit {
        print("\(type(of: self)) - \(#function)")
    }
}

// MARK: - MainViewOutput
extension MainPresenter: MainViewOutput {
    func viewIsReady() {
        print("\(type(of: self)) - \(#function)")

        view.setupInitialState()
        
        interactor.fetchData()
    }
}

// MARK: - MainInteractorOutput
extension MainPresenter: MainInteractorOutput {
    func setData(data: [Films]) {
        var viewModels: [MainViewModel] = []
        
        data.forEach { film in
            let vm = MainViewModel(item: film)
            vm.delegate = self
            viewModels.append(vm)
        }
        
        self._viewModels = viewModels
    }
}

// MARK: - MainModuleInput
extension MainPresenter: MainModuleInput {
    func configure(output: MainModuleOutput) {
        print("\(type(of: self)) - \(#function)")
        self.output = output
    }
}

extension MainPresenter: MainViewModelDelegate {
    func setFavorite(id: String, _ isFavorite: Bool) {
        interactor.setFavorite(id: id, isFavorite)
    }
}
