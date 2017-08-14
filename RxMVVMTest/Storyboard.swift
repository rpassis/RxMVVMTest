//
//  Storyboard.swift
//  RxMVVMTest
//
//  Created by Rogerio de Paula Assis on 15/8/17.
//  Copyright © 2017 Tinybeans. All rights reserved.
//

import UIKit

enum Storyboard: String {

    case Main
    
    func instantiate<VC: UIViewController>(
        _ viewController: VC.Type,
        inBundle bundle: Bundle = Bundle.main)
        -> VC
        {
            let identifier = String(describing: viewController)
            let sb = UIStoryboard(name: self.rawValue, bundle: bundle)
            guard let vc = sb.instantiateViewController(withIdentifier: identifier) as? VC else {
                fatalError("Unable to instantiate VC with identifier \(identifier)")
            }
            return vc
    }
}

