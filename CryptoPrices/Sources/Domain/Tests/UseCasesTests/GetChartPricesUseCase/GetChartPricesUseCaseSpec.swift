//
//  GetChartPricesUseCaseSpec.swift
//  Domain
//
//  Created by Minh Pham on 27/12/2022.
//

import DomainTestHelpers
import Nimble
import Quick
import RepositoryProtocol
import TestHelpers
@testable import UseCases

final class GetChartPricesUseCaseSpec: QuickSpec {

    override func spec() {
        var useCase: GetChartPricesUseCase!
        var coinRepository: MockCoinRepositoryProtocol!

        describe("the GetChartPricesUseCase") {

            beforeEach {
                coinRepository = MockCoinRepositoryProtocol()
                useCase = GetChartPricesUseCase(repository: coinRepository)
            }

            describe("its execute() call") {

                context("when coinRepository returns success") {

                    let expectedDataPoints = MockDataPoint.array

                    beforeEach {
                        coinRepository.getChartPricesCoinIDFilterReturnValue = expectedDataPoints
                    }

                    it("returns correct value") {
                        await expect {
                            try await useCase.execute(coinID: "bitcoin", filter: .oneDay).compactMap { $0 as? MockDataPoint }
                        }
                        .to(equal(expectedDataPoints))
                    }
                }

                context("when coinRepository returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinRepository.getChartPricesCoinIDFilterThrowableError = expectedError
                    }

                    it("returns correct error") {
                        await expect {
                            try await useCase.execute(coinID: "bitcoin", filter: .oneDay)
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
