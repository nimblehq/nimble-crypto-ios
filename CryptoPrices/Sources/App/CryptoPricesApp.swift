//
//  CryptoPricesApp.swift
//  CryptoPrices
//
//  Created by Doan Thieu on 28/11/2022.
//

import Home
import SwiftUI

@main
struct CryptoPricesApp: App {

    init() {
        Font.Inter.registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
