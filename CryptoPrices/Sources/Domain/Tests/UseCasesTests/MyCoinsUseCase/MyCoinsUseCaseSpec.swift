import DomainTestHelpers
import Nimble
import Quick
import RepositoryProtocol
import TestHelpers
@testable import UseCases

final class MyCoinsUseCaseSpec: QuickSpec {

    override func spec() {
        var myCoinsUseCase: MyCoinsUseCase!
        var coinRepository: MockCoinRepositoryProtocol!

        describe("the MyCoinsUseCase") {

            beforeEach {
                coinRepository = MockCoinRepositoryProtocol()
                myCoinsUseCase = MyCoinsUseCase(repository: coinRepository)
            }

            describe("its execute() call") {

                context("when coinRepository returns success") {

                    let expectedCoins = [MockCoin.single]

                    beforeEach {
                        coinRepository.myCoinsReturnValue = expectedCoins
                    }

                    it("returns correct value") {
                        await expect {
                            try await myCoinsUseCase.execute().compactMap { $0 as? MockCoin }
                        }
                        .to(equal(expectedCoins))
                    }
                }

                context("when coinRepository returns failure") {

                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        coinRepository.myCoinsThrowableError = expectedError
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
