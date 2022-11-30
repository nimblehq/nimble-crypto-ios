//
//  ContentView.swift
//  CryptoPrices
//
//  Created by Doan Thieu on 28/11/2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Crypto Prices")
                .font(.system(size: 28.0))
                .fontWeight(.medium)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
