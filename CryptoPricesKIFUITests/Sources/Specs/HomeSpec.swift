//
//  HomeSpec.swift
//  CryptoPricesKIFUITests
//
//  Created by Bliss on 11/1/23.
//

@testable import Home
import Nimble
import Quick

final class HomeSpec: QuickSpec {

    override func spec() {

        describe("a Home screen") { @MainActor in

            describe("its open") {

                it("it shows its ui components") {
                    self.tester().waitForView(
                        withAccessibilityLabel: Strings.Home.Title.text
                    )
                }
            }
        }
    }
}
