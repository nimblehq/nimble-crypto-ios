//
//  JSONDecoder+APIDecoder.swift
//  Data
//
//  Created by Doan Thieu on 01/12/2022.
//

import Foundation

extension JSONDecoder {

    public static let apiDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
