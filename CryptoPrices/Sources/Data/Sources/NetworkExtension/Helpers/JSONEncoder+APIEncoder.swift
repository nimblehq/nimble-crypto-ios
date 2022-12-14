//
//  JSONDecoder+APIDecoder.swift
//  Data
//
//  Created by Doan Thieu on 09/12/2022.
//

import Foundation

extension JSONEncoder {

    public static let apiEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
}
