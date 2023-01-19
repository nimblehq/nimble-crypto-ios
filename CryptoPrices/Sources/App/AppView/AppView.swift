//
//  ContentView.swift
//  CryptoPrices
//
//  Created by Doan Thieu on 28/11/2022.
//

import Factory
import Home
import MyCoin
import SwiftUI

struct AppView: View {

    @StateObject private var appCoordinator: AppCoordinator = .init()
    @State private var showingMyCoin = false

    var body: some View {
        NavigationView {
            ZStack {
                HomeView(viewModel: Container.homeViewModel())
                    .environmentObject(appCoordinator.homeState)

                NavigationLink("", isActive: $showingMyCoin) {
                    appCoordinator.myCoinState.map {
                        MyCoinView(viewModel: Container.myCoinViewModel())
                            .environmentObject($0)
                            .labelsHidden()
                    }
                }
            }
        }
        .onReceive(appCoordinator.$myCoinState) {
            showingMyCoin = $0 != nil
        }
    }
}
