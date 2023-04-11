//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactRequired : Codable, Equatable {
    public var property : String?
    public var messages : [String]?

    enum CodingKeys: String, CodingKey {
        case property = "property"
        case messages = "messages"
    }

    public init(){
        messages = [""]
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        property = try values.decodeIfPresent(String.self, forKey: .property)
        messages = try values.decodeIfPresent([String].self, forKey: .messages)
    }
    
    static public func == (lhs: ZactRequired, rhs: ZactRequired) -> Bool {
        return lhs.property == rhs.property
    }
}
