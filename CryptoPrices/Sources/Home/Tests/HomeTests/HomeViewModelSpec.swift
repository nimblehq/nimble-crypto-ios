import DomainTestHelpers
import Nimble
import Quick
import TestHelpers
@testable import Home

final class HomeViewModelSpec: QuickSpec {

    override func spec() {
        var homeViewModel: HomeViewModel!
        var myCoinsUseCase: MockMyCoinsUseCase!

        describe("the HomeViewModel") {
            beforeEach {
                myCoinsUseCase = MockMyCoinsUseCase()
                homeViewModel = await HomeViewModel(myCoinsUseCase: myCoinsUseCase)
            }

            describe("its initial state") {
                it("has the correct value for myCoins") {
                    await expect {
                        await homeViewModel.myCoins
                    }
                    .to(beEmpty())
                }
            }

            describe("its fetchMyCoins() call") {
                context("when myCoinsUseCase returns success") {
                    let myCoinsReturnValue = [MockCoin.single]
                    let expectedCoins = [MyCoinItem(coin: MockCoin.single)]

                    beforeEach {
                        myCoinsUseCase.myCoinsReturnValue = .success(myCoinsReturnValue)
                        await homeViewModel.fetchMyCoins()
                    }

                    it("gets the correct value for myCoins") {
                        await expect {
                            await homeViewModel.myCoins
                        }
                        .to(equal(expectedCoins))
                    }
                }

                context("when myCoinsUseCase returns failure") {
                    let expectedError = TestError.fail("API error")

                    beforeEach {
                        myCoinsUseCase.myCoinsReturnValue = .failure(expectedError)
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
        }
    }
}
