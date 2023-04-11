//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactClaimAmount: Codable, Equatable {
    public var claimType: String?
    public var amount: ZactBaseAmount?
    
    enum CodingKeys: String, CodingKey {
        case claimType = "claimType"
        case amount = "amount"
    }
    
    public init(){
        amount = ZactBaseAmount()
        claimType = ""
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        claimType = try values.decodeIfPresent(String.self, forKey: .claimType)
        amount = try values.decodeIfPresent(ZactBaseAmount.self, forKey: .amount)
    }
    
    public static func == (lhs: ZactClaimAmount, rhs: ZactClaimAmount) -> Bool {
        return lhs.amount == rhs.amount
        && lhs.claimType == rhs.claimType
    }
}
