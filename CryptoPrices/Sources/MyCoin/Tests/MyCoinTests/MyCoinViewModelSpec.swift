//
//  MyCoinViewModelSpec.swift
//  MyCoin
//
//  Created by Khanh on 01/02/2023.
//
// swiftlint:disable closure_body_length

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

                it("has the correct value for coinDetail") {
                    await expect {
                        await myCoinViewModel.coinDetail
                    }
                    .to(beNil())
                }
            }

            describe("its fetchCoinDetail() call") {

                context("when coinDetailUseCase returns success") {

                    let coinDetailReturnValue = MockCoinDetail.single
                    let expectedCoins = CoinDetailItem(coinDetail: MockCoinDetail.single)

                    beforeEach {
                        coinDetailUseCase.executeIdReturnValue = coinDetailReturnValue
                        await myCoinViewModel.fetchCoinDetail(id: "bitcoin")
                    }

                    it("gets the correct value for coinDetail") {
                        await expect { await myCoinViewModel.coinDetail }
                            .to(equal(expectedCoins))
                    }
                }

                context("when coinDetailUseCase returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinDetailUseCase.executeIdThrowableError = expectedError
                        await myCoinViewModel.fetchCoinDetail(id: "bitcoin")
                    }

                    it("gets the correct value for coinDetail") {
                        await expect {
                            await myCoinViewModel.coinDetail
                        }
                        .to(beNil())
                    }
                }
            }
        }
    }
}
