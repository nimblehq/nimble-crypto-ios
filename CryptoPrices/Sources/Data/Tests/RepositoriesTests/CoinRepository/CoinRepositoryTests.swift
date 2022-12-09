import NetworkCore
import Nimble
import Quick
import TestHelpers
@testable import Repositories

final class CoinRepositoryTests: QuickSpec {

    override func spec() {
        var coinRepository: CoinRepository!
        var coinAPI: MockCoinAPI!

        describe("The CoinRepository") {
            beforeEach {
                coinAPI = MockCoinAPI()
                coinRepository = CoinRepository(coinAPI: coinAPI)
            }

            describe("its myCoins()") {
                context("when coinAPI returns success") {
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
        }
    }
}
