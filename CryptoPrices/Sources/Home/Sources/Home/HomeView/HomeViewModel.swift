//
//  HomeViewModel.swift
//  Home
//
//  Created by Doan Thieu on 14/12/2022.
//

import SwiftUI
import UseCaseProtocol

@MainActor public final class HomeViewModel: ObservableObject {

    private let myCoinsUseCase: MyCoinsUseCaseProtocol

    @Published public private(set) var myCoins: [MyCoinItem] = []

    public init(myCoinsUseCase: MyCoinsUseCaseProtocol) {
        self.myCoinsUseCase = myCoinsUseCase
    }

    public func fetchMyCoins() async {
        do {
            myCoins = try await myCoinsUseCase.execute()
                .map(MyCoinItem.init)
        } catch {
            // TODO: Handle errors
        }
    }
}
