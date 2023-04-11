//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactRequiredAttributes: Codable, Equatable {
    public var expenseTypeUid : String?
    public var label : String?
    public var attributeType: String?
    public var multiple: Bool?
    public var receiptsRequired: Bool?
    public var message: String?
    
    enum CodingKeys: String, CodingKey {
        case expenseTypeUid = "expenseTypeUid"
        case label = "label"
        case attributeType = "attributeType"
        case multiple = "multiple"
        case receiptsRequired = "receiptsRequired"
        case message = "message"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        expenseTypeUid = try values.decodeIfPresent(String.self, forKey: .expenseTypeUid)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        attributeType = try values.decodeIfPresent(String.self, forKey: .attributeType)
        multiple = try values.decodeIfPresent(Bool.self, forKey: .multiple)
        receiptsRequired = try values.decodeIfPresent(Bool.self, forKey: .receiptsRequired)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
    public init(expenseTypeUid: String?, label: String?, attributeType: String?, multiple: Bool?, receiptsRequired: Bool?, message: String?) {
        self.expenseTypeUid = expenseTypeUid
        self.label = label
        self.attributeType = attributeType
        self.multiple = multiple
        self.receiptsRequired = receiptsRequired
        self.message = message
    }
}
