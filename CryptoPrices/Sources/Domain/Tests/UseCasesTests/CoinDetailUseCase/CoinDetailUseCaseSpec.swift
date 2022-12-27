//
//  CoinDetailUseCaseSpec.swift
//
//  Created by Khanh on 27/12/2022.
//

import DomainTestHelpers
import Nimble
import Quick
import RepositoryProtocol
import TestHelpers
@testable import UseCases

final class CoinDetailUseCaseSpec: QuickSpec {

    override func spec() {

        var useCase: CoinDetailUseCase!
        var coinRepository: MockCoinRepositoryProtocol!

        let mockCoinID = "bitcoin"

        describe("the CoinDetailUseCase") {

            beforeEach {
                coinRepository = MockCoinRepositoryProtocol()
                useCase = CoinDetailUseCase(repository: coinRepository)
            }

            describe("its execute() call") {

                context("when coinRepository returns success") {

                    let expectedCoin = MockCoin.single

                    beforeEach {
                        coinRepository.coinDetailIdReturnValue = expectedCoin
                    }

                    it("returns correct value") {

                        await expect {
                            try await useCase.execute(id: mockCoinID) as? MockCoin
                        }
                        .to(equal(expectedCoin))
                    }
                }

                context("when coinRepository returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinRepository.coinDetailIdThrowableError = expectedError
                    }

                    it("returns correct error") {
                        await expect {
                            try await useCase.execute(id: mockCoinID)
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
