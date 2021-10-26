//
//  UIViewController+Childs.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 24.10.2021.
//

import UIKit

extension UIViewController {
    func add(child: UIViewController, container: UIView) {
        self.addChild(child)
        child.view.frame = container.bounds
        container.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove(child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
