//
//  AppCoordinator.swift
//  CryptoPrices
//
//  Created by Khanh on 19/12/2022.
//

import Combine
import Home
import MyCoin
import SwiftUI

final class AppCoordinator: ObservableObject {

    @Published var homeState: HomeState = .init()
    @Published var myCoinState: MyCoinState?

    init() {
        let myCoinStatePublisher = $homeState
            .flatMap(\.$didSelectCoin)
            .compactMap { $0 }
            .map { Just(MyCoinState(id: $0)) }
            .assertNoFailure()
            .switchToLatest()
            .share()

        myCoinStatePublisher
            .map(Optional.some)
            .assign(to: &$myCoinState)

        myCoinStatePublisher
            .flatMap(\.$didSelectBack)
            .filter { $0 }
            .map { _ in nil }
            .assign(to: &$myCoinState)
    }
}
