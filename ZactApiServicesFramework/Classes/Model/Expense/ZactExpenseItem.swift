//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactExpenseItem: Codable, Equatable {
    public let amount: ZactBaseAmount?
    public let item: String?
    
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case item = "item"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        amount = try values.decodeIfPresent(ZactBaseAmount.self, forKey: .amount)
        item = try values.decodeIfPresent(String.self, forKey: .item)
    }
    
    static public func == (lhs: ZactExpenseItem, rhs: ZactExpenseItem) -> Bool {
        return lhs.amount == rhs.amount
    }
}
