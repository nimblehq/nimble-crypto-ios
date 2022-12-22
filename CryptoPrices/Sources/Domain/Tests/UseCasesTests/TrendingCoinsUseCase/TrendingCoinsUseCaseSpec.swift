//
//  TrendingCoinsUseCaseSpec.swift
//  UseCaseTests
//
//  Created by Minh Pham on 16/12/2022.
//

import DomainMocks
import Nimble
import Quick
import TestHelpers
@testable import UseCases

final class TrendingCoinsUseCaseSpec: QuickSpec {

    override func spec() {

        var useCase: TrendingCoinsUseCase!
        var coinRepository: MockCoinRepositoryProtocol!

        let mockCoinIDs = [
            "bitcoin",
            "ethereum",
            "binancecoin",
            "ripple",
            "cardano",
            "solana",
            "polkadot",
            "near",
            "tron",
            "dogecoin"
        ]

        describe("the TrendingCoinsUseCase") {

            beforeEach {
                coinRepository = MockCoinRepositoryProtocol()
                useCase = TrendingCoinsUseCase(repository: coinRepository)
            }

            describe("its execute() call") {

                context("when coinRepository returns success") {

                    let expectedCoins = [MockCoin.single]

                    beforeEach {
                        coinRepository.trendingCoinsCoinIDsReturnValue = expectedCoins
                    }

                    it("returns correct value") {

                        await expect {
                            try await useCase.execute(coinIDs: mockCoinIDs).compactMap { $0 as? MockCoin }
                        }
                        .to(equal(expectedCoins))
                    }
                }

                context("when coinRepository returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinRepository.trendingCoinsCoinIDsThrowableError = expectedError
                    }

                    it("returns correct error") {
                        await expect {
                            try await useCase.execute(coinIDs: mockCoinIDs)
                        }
                        .to(throwError { error in
                            expect(error).to(equal(expectedError))
                        })
                    }
                }
            }
        }
    }
}
