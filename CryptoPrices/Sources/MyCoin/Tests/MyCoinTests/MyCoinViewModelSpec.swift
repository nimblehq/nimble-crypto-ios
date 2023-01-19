//
//  MyCoinViewModelSpec.swift
//  MyCoin
//
//  Created by Khanh on 01/02/2023.
//
// swiftlint:disable closure_body_length function_body_length

import DomainTestHelpers
import Nimble
import Quick
import TestHelpers
import UseCaseProtocol
@testable import MyCoin

final class MyCoinViewModelSpec: QuickSpec {

    override func spec() {

        var myCoinViewModel: MyCoinViewModel!
        var coinDetailUseCase: MockCoinDetailUseCaseProtocol!
        var getChartPricesUseCase: MockGetChartPricesUseCaseProtocol!

        describe("the MyCoinViewModel") {

            beforeEach {
                coinDetailUseCase = MockCoinDetailUseCaseProtocol()
                getChartPricesUseCase = MockGetChartPricesUseCaseProtocol()
                myCoinViewModel = await MyCoinViewModel(
                    coinDetailUseCase: coinDetailUseCase,
                    getChartPricesUseCase: getChartPricesUseCase
                )
            }

            describe("its initial state") {

                it("returns nil for coinDetail") {
                    await expect { await myCoinViewModel.coinDetail }
                        .to(beNil())
                }

                it("returns empty chart data") {
                    await expect { await myCoinViewModel.chartData }
                        .to(equal([]))
                }

                it("has the correct value for isFetchingData") {
                    await expect {
                        await myCoinViewModel.isFetchingData
                    }
                    .to(beFalse())
                }
            }

            describe("its fetchCoinDetail() call") {

                context("when coinDetailUseCase returns success") {

                    let coinDetailReturnValue = MockCoinDetail.single
                    let expectedCoin = CoinDetailItem(coinDetail: MockCoinDetail.single)

                    beforeEach {
                        coinDetailUseCase.executeIdReturnValue = coinDetailReturnValue
                        await myCoinViewModel.fetchCoinDetail(id: "bitcoin")
                    }

                    it("gets the correct value for coinDetail") {
                        await expect { await myCoinViewModel.coinDetail }
                            .to(equal(expectedCoin))
                    }
                }

                context("when coinDetailUseCase returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinDetailUseCase.executeIdThrowableError = expectedError
                        await myCoinViewModel.fetchCoinDetail(id: "bitcoin")
                    }

                    it("returns nil for coinDetail") {
                        await expect { await myCoinViewModel.coinDetail }
                            .to(beNil())
                    }
                }
            }

            describe("its fetchChartPricesData() call") {

                context("when getChartPricesUseCase returns success") {

                    let chartDataReturnValue = MockDataPoint.array
                    let expectedChartData = chartDataReturnValue.map { ChartDataPointUIModel(dataPoint: $0) }

                    beforeEach {
                        getChartPricesUseCase.executeCoinIDFilterReturnValue = chartDataReturnValue
                        await myCoinViewModel.fetchChartPricesData(
                            id: "bitcoin",
                            timeFrameItem: .init(timeFrame: .oneWeek)
                        )
                    }

                    it("gets the correct value for chartData") {
                        await expect { await myCoinViewModel.chartData }
                            .to(equal(expectedChartData))
                    }
                }

                context("when getChartPricesUseCase returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        getChartPricesUseCase.executeCoinIDFilterThrowableError = expectedError
                        await myCoinViewModel.fetchChartPricesData(
                            id: "bitcoin",
                            timeFrameItem: .init(timeFrame: .oneDay)
                        )
                    }

                    it("returns empty chart data") {
                        await expect { await myCoinViewModel.chartData }
                            .to(equal([]))
                    }
                }
            }

            describe("its fetchData() call") {

                context("when coinDetailUseCase and getChartPricesUseCase return success") {
                    let coinDetailReturnValue = MockCoinDetail.single
                    let expectedCoin = CoinDetailItem(coinDetail: MockCoinDetail.single)
                    let chartDataReturnValue = MockDataPoint.array
                    let expectedChartData = chartDataReturnValue.map { ChartDataPointUIModel(dataPoint: $0) }

                    beforeEach {
                        coinDetailUseCase.executeIdReturnValue = coinDetailReturnValue
                        getChartPricesUseCase.executeCoinIDFilterReturnValue = chartDataReturnValue
                        await myCoinViewModel.fetchData(id: "bitcoin", timeFrameItem: .init(timeFrame: .oneDay))
                    }

                    it("gets the correct value for coinDetail") {
                        await expect { await myCoinViewModel.coinDetail }
                            .to(equal(expectedCoin))
                    }

                    it("gets the correct value for chartData") {
                        await expect { await myCoinViewModel.chartData }
                            .to(equal(expectedChartData))
                    }

                    it("returns chart data successfully") {
                        await expect { await myCoinViewModel.isSuccess }
                            .to(equal(true))
                    }

                    it("has the correct value for isFetchingData") {
                        await expect {
                            await myCoinViewModel.isFetchingData
                        }
                        .to(beFalse())
                    }
                }

                context("when coinDetailUseCase returns success but getChartPricesUseCase returns failure") {
                    let coinDetailReturnValue = MockCoinDetail.single
                    let expectedCoin = CoinDetailItem(coinDetail: MockCoinDetail.single)
                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinDetailUseCase.executeIdReturnValue = coinDetailReturnValue
                        getChartPricesUseCase.executeCoinIDFilterThrowableError = expectedError
                        await myCoinViewModel.fetchData(id: "bitcoin", timeFrameItem: .init(timeFrame: .oneDay))
                    }

                    it("gets the correct value for coinDetail") {
                        await expect { await myCoinViewModel.coinDetail }
                            .to(equal(expectedCoin))
                    }

                    it("returns empty chart data") {
                        await expect { await myCoinViewModel.chartData }
                            .to(equal([]))
                    }

                    it("returns chart data unsuccessfully") {
                        await expect { await myCoinViewModel.isSuccess }
                            .to(equal(false))
                    }

                    it("has the correct value for isFetchingData") {
                        await expect {
                            await myCoinViewModel.isFetchingData
                        }
                        .to(beFalse())
                    }
                }

                context("when getChartPricesUseCase returns success but coinDetailUseCase returns failure") {
                    let chartDataReturnValue = MockDataPoint.array
                    let expectedChartData = chartDataReturnValue.map { ChartDataPointUIModel(dataPoint: $0) }
                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinDetailUseCase.executeIdThrowableError = expectedError
                        getChartPricesUseCase.executeCoinIDFilterReturnValue = chartDataReturnValue
                        await myCoinViewModel.fetchData(id: "bitcoin", timeFrameItem: .init(timeFrame: .oneDay))
                    }

                    it("returns nil for coinDetail") {
                        await expect { await myCoinViewModel.coinDetail }
                            .to(beNil())
                    }

                    it("gets the correct value for chartData") {
                        await expect { await myCoinViewModel.chartData }
                            .to(equal(expectedChartData))
                    }

                    it("returns chart data successfully") {
                        await expect { await myCoinViewModel.isSuccess }
                            .to(equal(true))
                    }

                    it("has the correct value for isFetchingData") {
                        await expect {
                            await myCoinViewModel.isFetchingData
                        }
                        .to(beFalse())
                    }
                }

                context("when coinDetailUseCase and getChartPricesUseCase both return failure") {
                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinDetailUseCase.executeIdThrowableError = expectedError
                        getChartPricesUseCase.executeCoinIDFilterThrowableError = expectedError
                        await myCoinViewModel.fetchData(id: "bitcoin", timeFrameItem: .init(timeFrame: .oneDay))
                    }

                    it("returns nil for coinDetail") {
                        await expect { await myCoinViewModel.coinDetail }
                            .to(beNil())
                    }

                    it("returns empty chart data") {
                        await expect { await myCoinViewModel.chartData }
                            .to(equal([]))
                    }

                    it("returns chart data unsuccessfully") {
                        await expect { await myCoinViewModel.isSuccess }
                            .to(equal(false))
                    }

                    it("has the correct value for isFetchingData") {
                        await expect {
                            await myCoinViewModel.isFetchingData
                        }
                        .to(beFalse())
                    }
                }
            }
        }
    }
}
