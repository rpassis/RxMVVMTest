//
//  ViewModel.swift
//  RxMVVMTest
//
//  Created by Rogerio de Paula Assis on 13/8/17.
//  Copyright © 2017 Tinybeans. All rights reserved.
//

import Foundation
import RxSwift
import ReSwift

class ViewModel {
    
    private let store: Store<AppState>
    let bag = DisposeBag()
    
    init(store: Store<AppState>) {
        self.store = store
    }
    
    func didUpdateUsername(_ username: String?) {
        self.store.dispatch(AppAction.updateUsername(username))
    }
    
    func didUpdatePassword(_ password: String?) {
        self.store.dispatch(AppAction.updatePassword(password))
    }
    
    var username: Observable<String?> {
        return self.store.rx.state.map({ (state) -> String? in
            return state.username
        }).asObservable()
    }
}
