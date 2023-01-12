//  MyCoinView.swift
//  MyCoin
//
//  Created by Mike Pham on 04/12/2022.
//

import DomainTestHelpers
import Styleguide
import SwiftUI

private typealias Section = Styleguide.Section

public struct MyCoinView: View {

    @EnvironmentObject var myCoinState: MyCoinState

    public var body: some View {
        List {
            currentPriceSection
            priceChartSection
            coinStatisticsSection
        }
        .listStyle(.plain)
        .background(Colors.bgMain.swiftUIColor)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: backButton, trailing: likeButton)
        .navigationTitle(viewModel.coinDetail?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .gesture(
            DragGesture()
                .onEnded { value in
                    // Handle swipe left-to-right
                    if value.startLocation.x < 20.0 && value.translation.width > 50.0 {
                        myCoinState.didSelectBack = true
                    }
                }
        )
        .safeAreaInset(edge: .bottom, content: {
            footerView
        })
        .task {
            await viewModel.fetchData(id: myCoinState.id)
        }
    }

    @ObservedObject private var viewModel: MyCoinViewModel

    public init(viewModel: MyCoinViewModel) {
        self.viewModel = viewModel
    }
}

private extension MyCoinView {

    var currentPriceSection: some View {
        Section {
            CurrentPriceSection()
        }
    }

    var priceChartSection: some View {
        Section {
            PriceLineChartSection(viewModel.chartData)
                .frame(height: 196.0)

            TimeFrameSection()
        }
    }

    var coinStatisticsSection: some View {
        Section {
            CoinStatisticsSection(
                coinDetailItem: viewModel.coinDetail
            )
        }
    }

    var backButton: some View {
        Button {
            myCoinState.didSelectBack = true
        } label: {
            Images.icBack.swiftUIImage
        }
    }

    var likeButton: some View {
        Images.icHeart.swiftUIImage
    }

    var sellButton: some View {
        Button(action: {}, label: {
            Text(Strings.MyCoin.SellButton.title)
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(SecondaryButtonStyle())
    }

    var buyButton: some View {
        Button(action: {}, label: {
            Text(Strings.MyCoin.BuyButton.title)
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(PrimaryButtonStyle())
    }

    var footerView: some View {
        HStack(alignment: .center, spacing: 24.0) {
            sellButton
            buyButton
        }
        .padding(16.0)
        .background(Colors.bgMain.swiftUIColor)
    }
}

#if DEBUG
import UseCaseProtocol

struct MyCoinView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            MyCoinView(
                viewModel: MyCoinViewModel(
                    coinDetailUseCase: MockCoinDetailUseCaseProtocol(),
                    getChartPricesUseCase: MockGetChartPricesUseCaseProtocol()
                )
            )
        }
    }
}
#endif
