//
//  Parameterable.swift
//  Data
//
//  Created by Doan Thieu on 09/12/2022.
//

import Foundation

public protocol Parameterable: Encodable {}

extension Parameterable {

    private func encoded(boolValue: Bool) -> String {
        return boolValue ? "true" : "false"
    }

    public func encoded(encoder: JSONEncoder = .apiEncoder) -> [String: String] {
        guard let parameters = try? JSONSerialization.jsonObject(
            with: encoder.encode(self), options: .allowFragments
        ) as? [String: Any] else {
            return [:]
        }

        var encodedParameters = [String: String]()

        for (key, value) in parameters {
            if let boolValue = value as? Bool {
                encodedParameters[key] = encoded(boolValue: boolValue)
            } else {
                encodedParameters[key] = "\(value)"
            }
        }

        return encodedParameters
    }
}
