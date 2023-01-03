//
//  MyCoinViewModel.swift
//  MyCoin
//
//  Created by Khanh on 02/01/2023.
//

import Foundation
import UseCaseProtocol

@MainActor public final class MyCoinViewModel: ObservableObject {

    private let coinDetailUseCase: CoinDetailUseCaseProtocol

    @Published public private(set) var coinDetail: CoinDetailItem?

    public init(coinDetailUseCase: CoinDetailUseCaseProtocol) {
        self.coinDetailUseCase = coinDetailUseCase
    }

    public func fetchCoinDetail(id: String) async {
        do {
            coinDetail = try await CoinDetailItem(coinDetail: coinDetailUseCase.execute(id: id))
        } catch {
            // TODO: Handle errors
        }
    }
}
