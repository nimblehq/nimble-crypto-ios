//
//  String+utf8Data.swift
//  Data
//
//  Created by Doan Thieu on 09/12/2022.
//

import Foundation

public extension String {

    var utf8Data: Data { .init(utf8) }
}
