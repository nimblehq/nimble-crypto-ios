//
//  Localizable.swift
//  Home
//
//  Created by Minh Pham on 06/12/2022.
//

import Foundation

@propertyWrapper
struct Localizable {

    var wrappedValue: String {
        didSet {
            wrappedValue = NSLocalizedString(wrappedValue, bundle: .module, comment: "")
        }
    }

    init(wrappedValue: String) {
        self.wrappedValue = NSLocalizedString(wrappedValue, bundle: .module, comment: "")
    }
}
