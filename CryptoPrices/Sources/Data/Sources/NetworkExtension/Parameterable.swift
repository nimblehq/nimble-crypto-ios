//
//  Parameterable.swift
//  Data
//
//  Created by Doan Thieu on 09/12/2022.
//

import Foundation

public protocol Parameterable: Encodable {}

public extension Parameterable {

    func encoded(encoder: JSONEncoder = .apiEncoder) -> [String: Any] {
        guard let dictionary = try? JSONSerialization.jsonObject(
            with: encoder.encode(self), options: .allowFragments
        ) as? [String: Any] else {
            return [:]
        }

        return dictionary
    }
}
