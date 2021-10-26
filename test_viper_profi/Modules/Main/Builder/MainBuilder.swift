//
//  MainBuilder.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 24.10.2021.
//

import Foundation

class MainBuilder {
	struct MainBuild {
		let view: MainViewController
		let presenter: MainPresenter
		let interactor: MainInteractor
		let router: MainRouter

		init(view: MainViewController, presenter: MainPresenter, interactor: MainInteractor, router: MainRouter) {
			self.view = view
			self.presenter = presenter
			self.interactor = interactor
			self.router = router

			self.view.output = self.presenter

			self.presenter.interactor = self.interactor
			self.presenter.view = self.view
			self.presenter.router = self.router

			self.interactor.output = self.presenter

//			self.router.transitionHandler = self.view
		}
	}

	func build() -> MainBuild {
		print("\(type(of: self)) - build")

		let mainBuild = MainBuild(view: MainViewController(), presenter: MainPresenter(), interactor: MainInteractor(), router: MainRouter())

		return mainBuild
	}

	deinit {
		print("\(type(of: self)) - \(#function)")
	}
}
