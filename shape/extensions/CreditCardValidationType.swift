//
//  CreditCardValidationType.swift
//  shape
//
//  Created by Jordan Wood on 2/22/20.
//  Copyright © 2020 jwood. All rights reserved.
//

import Foundation

public func == (lhs: CreditCardValidationType, rhs: CreditCardValidationType) -> Bool {
    return lhs.name == rhs.name
}

public struct CreditCardValidationType: Equatable {
    public var name: String
    public var regex: String

    public init(dict: [String: Any]) {
        name = dict["name"] as? String ?? ""
        regex = dict["regex"] as? String ?? ""
    }
}
