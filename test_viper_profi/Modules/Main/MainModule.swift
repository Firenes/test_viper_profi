//
//  MainModule.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 24.10.2021.
//

import UIKit

class MainModule {
    typealias Input = MainModuleInput

    private var controller: UIViewController

    required init() {
        let builder = MainBuilder()
        let build = builder.build()
        controller = build.view
    }


    deinit {
        print("\(type(of: self)) - \(#function)")
    }
}
