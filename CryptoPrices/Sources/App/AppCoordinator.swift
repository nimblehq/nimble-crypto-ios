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

    @Published var state: AppState = .home(HomeState())

    private var cancellables = Set<AnyCancellable>()

    init() {
        $state
            .compactMap { currentState -> HomeState? in
                if case let .home(homeState) = currentState {
                    return homeState
                }
                return nil
            }
            .flatMap(\.$didSelectCoin)
            .filter { $0 }
            .sink(receiveValue: { [weak self] _ in
                self?.state = .myCoin(MyCoinState())
            })
            .store(in: &cancellables)

        $state
            .compactMap { currentState -> MyCoinState? in
                if case let .myCoin(myCoinState) = currentState {
                    return myCoinState
                }
                return nil
            }
            .flatMap(\.$didSelectBack)
            .filter { $0 }
            .sink(receiveValue: { [weak self] _ in
                self?.state = .home(HomeState())
            })
            .store(in: &cancellables)
    }
}
