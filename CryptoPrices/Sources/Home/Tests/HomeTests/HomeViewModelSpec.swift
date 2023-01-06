//
//  HomeViewModelSpec.swift
//  Home
//
//  Created by Mike Pham on 12/30/2022.
//
// swiftlint:disable function_body_length closure_body_length

import DomainTestHelpers
import Nimble
import Quick
import TestHelpers
import UseCaseProtocol
@testable import Home

final class HomeViewModelSpec: QuickSpec {

    override func spec() {

        var homeViewModel: HomeViewModel!
        var myCoinsUseCase: MockMyCoinsUseCaseProtocol!
        var trendingCoinsUseCase: MockTrendingCoinsUseCaseProtocol!

        describe("the HomeViewModel") {

            beforeEach {
                myCoinsUseCase = MockMyCoinsUseCaseProtocol()
                trendingCoinsUseCase = MockTrendingCoinsUseCaseProtocol()
                homeViewModel = await HomeViewModel(
                    myCoinsUseCase: myCoinsUseCase,
                    trendingCoinsUseCase: trendingCoinsUseCase
                )
            }

            describe("its initial state") {

                it("has the correct value for myCoins") {
                    await expect {
                        await homeViewModel.myCoins
                    }
                    .to(beEmpty())
                }

                it("has the correct value for trendingCoins") {
                    await expect {
                        await homeViewModel.trendingCoins
                    }
                    .to(beEmpty())
                }
            }

            describe("its fetchMyCoins() call") {

                context("when myCoinsUseCase returns success") {

                    let myCoinsReturnValue = [MockCoin.single]
                    let expectedCoins = [MyCoinItem(coin: MockCoin.single)]

                    beforeEach {
                        myCoinsUseCase.executeReturnValue = myCoinsReturnValue
                        await homeViewModel.fetchMyCoins()
                    }

                    it("gets the correct value for myCoins") {
                        await expect { await homeViewModel.myCoins }
                            .to(equal(expectedCoins))
                    }
                }

                context("when myCoinsUseCase returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        myCoinsUseCase.executeThrowableError = expectedError
                        await homeViewModel.fetchMyCoins()
                    }

                    it("gets the correct value for myCoins") {
                        await expect {
                            await homeViewModel.myCoins
                        }
                        .to(beEmpty())
                    }
                }
            }

            describe("its fetchTrendingCoins() call") {

                context("when trendingCoinsUseCase returns success") {

                    let trendingCoinsReturnValue = [MockCoin.single]
                    let expectedCoins = [TrendingCoinItem(coin: MockCoin.single)]

                    beforeEach {
                        trendingCoinsUseCase.executeCoinIDsReturnValue = trendingCoinsReturnValue
                        await homeViewModel.fetchTrendingCoins()
                    }

                    it("gets the correct value for trendingCoins") {
                        await expect { await homeViewModel.trendingCoins }
                            .to(equal(expectedCoins))
                    }
                }

                context("when trendingCoinsUseCase returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        trendingCoinsUseCase.executeCoinIDsThrowableError = expectedError
                        await homeViewModel.fetchTrendingCoins()
                    }

                    it("gets the correct value for trendingCoins") {
                        await expect {
                            await homeViewModel.trendingCoins
                        }
                        .to(beEmpty())
                    }
                }
            }

            describe("its fetchAllData() call") {

                context("when myCoinsUseCase and trendingCoinsUseCase return success") {
                    let returnValue = [MockCoin.single]
                    let expectedMyCoins = [MyCoinItem(coin: MockCoin.single)]
                    let expectedTrendinglCoins = [TrendingCoinItem(coin: MockCoin.single)]

                    beforeEach {
                        myCoinsUseCase.executeReturnValue = returnValue
                        trendingCoinsUseCase.executeCoinIDsReturnValue = returnValue
                        await homeViewModel.fetchAllData()
                    }

                    it("gets the correct value for myCoins") {
                        await expect { await homeViewModel.myCoins }
                            .to(equal(expectedMyCoins))
                    }

                    it("gets the correct value for trendingCoins") {
                        await expect { await homeViewModel.trendingCoins }
                            .to(equal(expectedTrendinglCoins))
                    }
                }
            }

            describe("its fetchAllData() call") {

                context("when myCoinsUseCase returns success, trendingCoinsUseCase returns failure") {
                    let returnValue = [MockCoin.single]
                    let expectedMyCoins = [MyCoinItem(coin: MockCoin.single)]
                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        myCoinsUseCase.executeReturnValue = returnValue
                        trendingCoinsUseCase.executeCoinIDsThrowableError = expectedError
                        await homeViewModel.fetchAllData()
                    }

                    it("gets the correct value for myCoins") {
                        await expect { await homeViewModel.myCoins }
                            .to(equal(expectedMyCoins))
                    }

                    it("gets the correct value for trendingCoins") {
                        await expect { await homeViewModel.trendingCoins }
                            .to(beEmpty())
                    }
                }
            }

            describe("its fetchAllData() call") {

                context("when myCoinsUseCase and trendingCoinsUseCase return failure") {
                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        myCoinsUseCase.executeThrowableError = expectedError
                        trendingCoinsUseCase.executeCoinIDsThrowableError = expectedError
                        await homeViewModel.fetchAllData()
                    }

                    it("gets the correct value for myCoins") {
                        await expect { await homeViewModel.myCoins }
                            .to(beEmpty())
                    }

                    it("gets the correct value for trendingCoins") {
                        await expect { await homeViewModel.trendingCoins }
                            .to(beEmpty())
                    }
                }
            }
        }
    }
}
