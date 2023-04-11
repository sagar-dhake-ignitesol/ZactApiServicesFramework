//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactExpenseReceipts : Codable, Equatable {
    
    public var reasonMissing: String?
    public var receiptsList: [ZactReceipt]?
    
    public init(){
        receiptsList = [ZactReceipt]()
    }
    
    public init(receipt: ZactReceipt){
        receiptsList = [receipt]
    }
    
    enum CodingKeys: String, CodingKey {
        case reasonMissing = "reasonMissing"
        case receiptsList = "receiptsList"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reasonMissing = try values.decodeIfPresent(String.self, forKey: .reasonMissing)
        receiptsList = try values.decodeIfPresent([ZactReceipt].self, forKey: .receiptsList)
    }
    
    static public func == (lhs: ZactExpenseReceipts, rhs: ZactExpenseReceipts) -> Bool {
        return lhs.reasonMissing == rhs.reasonMissing
            && lhs.receiptsList?.elementsEqual(rhs.receiptsList ?? []) ?? true
    }
}
