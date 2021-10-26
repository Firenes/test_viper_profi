//
//  RootViewController.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 24.10.2021.
//

import UIKit

class RootViewController: UIViewController {
    private var currentVC: UIViewController
    
    init() {
        currentVC = MainBuilder().build().view
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        self.add(child: currentVC, container: self.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
