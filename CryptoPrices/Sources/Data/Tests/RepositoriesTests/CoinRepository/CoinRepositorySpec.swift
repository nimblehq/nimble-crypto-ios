//
//  CoinRepositorySpec.swift
//  RepositoriesTests
//
//  Created by Doan Thieu on 29/11/2022.
//
// swiftlint:disable function_body_length closure_body_length superfluous_disable_command

import DataTestHelpers
import NetworkCore
import Nimble
import Quick
import TestHelpers
@testable import Repositories

final class CoinRepositorySpec: QuickSpec {

    override func spec() {

        var coinAPI: MockCoinAPI!
        var coinRepository: CoinRepository!

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

        describe("the CoinRepository") {

            beforeEach {
                coinAPI = MockCoinAPI()
                coinRepository = CoinRepository(coinAPI: coinAPI)
            }

            context("when myCoins() is called") {

                context("when the coinAPI returns success") {
                    let expectedCoins = APICoin.dummyCoins

                    beforeEach {
                        coinAPI.myCoinsReturnValue = .success(expectedCoins)
                    }

                    it("returns correct value") {
                        await expect {
                            try await coinRepository.myCoins().compactMap { $0 as? APICoin }
                        }
                        .to(equal(expectedCoins))
                    }
                }

                context("when coinAPI returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinAPI.myCoinsReturnValue = .failure(expectedError)
                    }

                    it("returns correct error") {
                        await expect {
                            try await coinRepository.myCoins()
                        }
                        .to(throwError { error in
                            expect(error).to(equal(expectedError))
                        })
                    }
                }
            }

            context("when trendingCoins() is called") {

                context("when the coinAPI returns success") {

                    let expectedCoins = APICoin.dummyCoins

                    beforeEach {
                        coinAPI.trendingCoinsReturnValue = .success(expectedCoins)
                    }

                    it("returns correct value") {
                        await expect {
                            try await coinRepository.trendingCoins(coinIDs: mockCoinIDs).compactMap { $0 as? APICoin }
                        }
                        .to(equal(expectedCoins))
                    }
                }

                context("when coinAPI returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinAPI.trendingCoinsReturnValue = .failure(expectedError)
                    }

                    it("returns correct error") {
                        await expect {
                            try await coinRepository.trendingCoins(coinIDs: mockCoinIDs)
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
