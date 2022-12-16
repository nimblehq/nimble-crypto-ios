//
//  TrendingCoinsUseCaseSpec.swift
//  UseCaseTests
//
//  Created by Minh Pham on 16/12/2022.
//

import DomainTestHelpers
import Nimble
import Quick
import TestHelpers
@testable import UseCases

final class TrendingCoinsUseCaseSpec: QuickSpec {

    override func spec() {
        var useCase: TrendingCoinsUseCase!
        var coinRepository: MockCoinRepository!

        describe("the MyCoinsUseCase") {

            beforeEach {
                coinRepository = MockCoinRepository()
                useCase = TrendingCoinsUseCase(repository: coinRepository)
            }

            context("when execute() is called") {

                context("when coinRepository returns success") {

                    let expectedCoins = [MockCoin.single]

                    beforeEach {
                        coinRepository.myCoinsReturnValue = .success(expectedCoins)
                    }

                    it("returns correct value") {
                        await expect {
                            try await useCase.execute().compactMap { $0 as? MockCoin }
                        }
                        .to(equal(expectedCoins))
                    }
                }

                context("when coinRepository returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinRepository.myCoinsReturnValue = .failure(expectedError)
                    }

                    it("returns correct error") {
                        await expect {
                            try await useCase.execute()
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
