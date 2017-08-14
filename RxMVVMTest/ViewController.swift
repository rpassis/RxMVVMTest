//
//  ViewController.swift
//  RxMVVMTest
//
//  Created by Rogerio de Paula Assis on 13/8/17.
//  Copyright © 2017 Tinybeans. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var viewModel: ViewModel!
    let bag = DisposeBag()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.username.filter { (username) -> Bool in
            return username?.count > 0 ?? false
        }.bind(to: loginButton.rx.isEnabled)
}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldChanged(sender: UITextField) {
        let value = sender.text
        if sender == usernameTextField {
            viewModel.didUpdateUsername(value)
        } else if sender == passwordTextField {
            viewModel.didUpdatePassword(value)
        }
    }
}

