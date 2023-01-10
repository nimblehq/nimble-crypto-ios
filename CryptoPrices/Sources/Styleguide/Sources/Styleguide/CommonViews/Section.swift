// swiftlint:disable type_contents_order
//
//  Section.swift
//  Home
//
//  Created by Doan Thieu on 06/01/2023.
//

import SwiftUI

public struct Section<Content, Header>: View where Content: View, Header: View {

    private let content: Content
    private let header: Header?

    public init(@ViewBuilder content: () -> Content) where Header == EmptyView {
        self.content = content()
        self.header = nil
    }

    public init(@ViewBuilder content: () -> Content, @ViewBuilder header: () -> Header) {
        self.content = content()
        self.header = header()
    }

    public var body: some View {
        VStack(spacing: 0.0) {
            header
            content
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Colors.bgMain.swiftUIColor)
        .listRowInsets(.init(top: 0.0, leading: 0.0, bottom: 16.0, trailing: 0.0))
    }
}
