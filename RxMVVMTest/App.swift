//
//  App.swift
//  RxMVVMTest
//
//  Created by Rogerio de Paula Assis on 13/8/17.
//  Copyright © 2017 Tinybeans. All rights reserved.
//

import Foundation
import ReSwift

struct AppState: StateType {
    var username: String? = nil
    var password: String? = nil
}

func mainReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    guard let action = action as? AppAction else { return state }
    switch action {
    case .updatePassword(let password):
        state.password = password
    case .updateUsername(let username):
        state.username = username
    }
    return state
}

enum AppAction: Action {
    case updateUsername(String?)
    case updatePassword(String?)
}

