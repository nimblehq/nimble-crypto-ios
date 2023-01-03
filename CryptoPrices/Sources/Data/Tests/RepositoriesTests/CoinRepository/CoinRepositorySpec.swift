//
//  CoinRepositorySpec.swift
//  RepositoriesTests
//
//  Created by Doan Thieu on 29/11/2022.
//
// swiftlint:disable function_body_length closure_body_length

import DataTestHelpers
import NetworkCore
import Nimble
import Quick
import TestHelpers
@testable import Repositories

final class CoinRepositorySpec: QuickSpec {

    override func spec() {

        var coinAPI: MockCoinAPIProtocol!
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
                coinAPI = MockCoinAPIProtocol()
                coinRepository = CoinRepository(coinAPI: coinAPI)
            }

            describe("its myCoins() call") {

                context("when the coinAPI returns success") {
                    let expectedCoins = APICoin.dummyCoins

                    beforeEach {
                        coinAPI.myCoinsReturnValue = expectedCoins
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
                        coinAPI.myCoinsThrowableError = expectedError
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

            describe("its trendingCoins() call") {

                context("when the coinAPI returns success") {

                    let expectedCoins = APICoin.dummyCoins

                    beforeEach {
                        coinAPI.trendingCoinsCoinIDsReturnValue = expectedCoins
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
                        coinAPI.trendingCoinsCoinIDsThrowableError = expectedError
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

            describe("its getChartPrices() call") {

                context("when the coinAPI returns success") {

                    let expectedPrices = APIPrices.dummyPrices

                    beforeEach {
                        coinAPI.getChartPricesCoinIDNumberOfDaysReturnValue = expectedPrices
                    }

                    it("returns correct value") {
                        await expect {
                            try await coinRepository.getChartPrices(coinID: "bitcoin", filter: .oneYear)
                                .compactMap { $0 as? DataPoint }
                        }.to(equal(expectedPrices.toDataPoints()))
                    }
                }

                context("when coinAPI returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinAPI.getChartPricesCoinIDNumberOfDaysThrowableError = expectedError
                    }

                    it("returns correct error") {
                        await expect {
                            try await coinRepository.getChartPrices(coinID: "bitcoin", filter: .oneYear)
                        }
                        .to(throwError { error in
                            expect(error).to(equal(expectedError))
                        })
                    }
                }
            }

            describe("its coinDetail() call") {

                context("when the coinAPI returns success") {

                    let expectedCoin = APICoinDetail.dummy

                    beforeEach {
                        coinAPI.coinDetailIdReturnValue = expectedCoin
                    }

                    it("returns correct value") {
                        await expect {
                            try await coinRepository.coinDetail(id: mockCoinIDs[0]) as? APICoinDetail
                        }
                        .to(equal(expectedCoin))
                    }
                }

                context("when coinAPI returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinAPI.coinDetailIdThrowableError = expectedError
                    }

                    it("returns correct error") {
                        await expect {
                            try await coinRepository.coinDetail(id: mockCoinIDs[0])
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
