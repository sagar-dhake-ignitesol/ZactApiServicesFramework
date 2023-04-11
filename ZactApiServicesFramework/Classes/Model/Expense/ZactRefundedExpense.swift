//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactRefundedExpense : Codable {
    
    public var uid : String?
    public var amount: ZactAmountAndTax?
    public var externalId: UInt64?
    public var nonBizExpenseAmount: ZactBaseAmount?
    public var allowedAmount : Double?
    public var vendor: String?
    
    enum CodingKeys: String, CodingKey {
        case uid = "uid"
        case amount = "amount"
        case externalId = "externalId"
        case vendor = "vendor"
        case nonBizExpenseAmount = "nonBizExpenseAmount"
        case allowedAmount = "allowedAmount"
    }
    
    init(){}
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uid = try values.decodeIfPresent(String.self, forKey: .uid)
        amount = try values.decodeIfPresent(ZactAmountAndTax.self, forKey: .amount)
        externalId = try values.decodeIfPresent(UInt64.self, forKey: .externalId)
        vendor = try values.decodeIfPresent(String.self, forKey: .vendor)
        nonBizExpenseAmount = try values.decodeIfPresent(ZactBaseAmount.self, forKey: .nonBizExpenseAmount)
        allowedAmount = try values.decodeIfPresent(Double.self, forKey: .allowedAmount)
    }
}

extension ZactRefundedExpense: Equatable {
    public static func == (lhs: ZactRefundedExpense, rhs: ZactRefundedExpense) -> Bool {
        return lhs.uid == rhs.uid
            && lhs.amount == rhs.amount
            && lhs.vendor == rhs.vendor
            && lhs.nonBizExpenseAmount == rhs.nonBizExpenseAmount
            && lhs.externalId == rhs.externalId
            && lhs.allowedAmount == rhs.allowedAmount
    }
}
