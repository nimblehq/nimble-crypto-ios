import DomainTestHelpers
import Nimble
import Quick
import TestHelpers
@testable import UseCases

final class MyCoinsUseCaseTests: QuickSpec {

    override func spec() {
        var myCoinsUseCase: MyCoinsUseCase!
        var coinRepository: MockCoinRepository!

        describe("The MyCoinsUseCase") {
            beforeEach {
                coinRepository = MockCoinRepository()
                myCoinsUseCase = MyCoinsUseCase(repository: coinRepository)
            }

            describe("its execute()") {
                context("when coinRepository returns success") {
                    let expectedCoins = [TestCoin.single]

                    beforeEach {
                        coinRepository.myCoinsReturnValue = .success(expectedCoins)
                    }

                    it("returns correct value") {
                        await expect {
                            try await myCoinsUseCase.execute().compactMap { $0 as? TestCoin }
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
                            try await myCoinsUseCase.execute()
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
