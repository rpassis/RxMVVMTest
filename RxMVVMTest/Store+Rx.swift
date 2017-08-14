//
//  Store+Rx.swift
//  RxMVVMTest
//
//  Copyright © 2017 Christian Tietze. All rights reserved. Distributed under the MIT License.
//

import ReSwift
import RxSwift

extension ReSwift.Store: ReactiveCompatible { }

extension Reactive where Base: ReSwift.StoreType {

    var state: Observable<Base.State> {
        return Observable.create { observer in
            let subscriber = ReactiveStoreSubscriber<Base.State>()
            self.base.subscribe(subscriber)

            let forward = subscriber.state.subscribe(observer)
            let cancel = Disposables.create {
                self.base.unsubscribe(subscriber)
            }

            return Disposables.create(forward, cancel)
        }
    }
}

fileprivate class ReactiveStoreSubscriber<S>: StoreSubscriber {

    internal typealias StoreSubscriberStateType = S

    fileprivate let subject = PublishSubject<S>()

    internal var state: Observable<S> {
        return subject.asObservable()
    }

    func newState(state: StoreSubscriberStateType) {

        self.subject.onNext(state)
    }
}
